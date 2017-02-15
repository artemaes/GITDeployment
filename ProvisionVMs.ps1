#ProvisionVMs

# Name of subscription; "Copy the SubscriptionName property you get from Get-AzureRMSubscription"
$SubscriptionName = "MSDN Platforms"
 
# Name of storage account (where VMs will be deployed);Copy the Label property you get from Get-AzureRMStorageAccount
$StorageAccount = "artresgroupdisks311" 
 
function Provision-VM( [string]$VmName ) {
    Start-Job -ArgumentList $VmName {
        param($VmName)
$Location = "Central US"
$InstanceSize = "Standard_DS2_v2" # You can use any other instance, such as Large, A6, and so on
$AdminUsername = "artemk" # Write the name of the administrator account in the new VM
$Password = "Rita200219hbnf"      # Write the password of the administrator account in the new VM
$Image = "a699494373c04fc0bc8f2bb1389d6106__Windows-Server-2012-R2-20170111-en.us-127GB.vhd" #"Copy the ImageName property you get from Get-AzureVMImage"
# You can list your own images using the following command:
# Get-AzureVMImage | Where-Object {$_.PublisherName -eq "User" }
#New-AzureRmVMConfig [-VMName] <String> [-VMSize] <String> [[-AvailabilitySetId] <String>] [<CommonParameters>]
      #New-AzureVMConfig -VMName $VmName -ImageName $Image -VMSize $InstanceSize | Add-AzureProvisioningConfig -Windows -Password $Password -AdminUsername $AdminUsername| New-AzureVM -Location $Location -ServiceName "$VmName" -Verbose
    }
}
 
# Set the proper storage - you might remove this line if you have only one storage in the subscription
Set-AzureSubscription -SubscriptionName $SubscriptionName -CurrentStorageAccount $StorageAccount
 
# Select the subscription - this line is fundamental if you have access to multiple subscription
# You might remove this line if you have only one subscription
Select-AzureRMSubscription -SubscriptionName $SubscriptionName
 
# Every line in the following list provisions one VM using the name specified in the argument
# You can change the number of lines - use a unique name for every VM - don't reuse names
# already used in other VMs already deployed
Provision-VM "test10"
Provision-VM "test11"
Provision-VM "test12"
#Provision-VM "test13"
#Provision-VM "test14"
#Provision-VM "test15"
#Provision-VM "test16"
#Provision-VM "test17"
#Provision-VM "test18"
#Provision-VM "test19"
#Provision-VM "test20"
 
# Wait for all to complete
While (Get-Job -State "Running") {
    Get-Job -State "Completed" | Receive-Job
    Start-Sleep 1
}
 
# Display output from all jobs
Get-Job | Receive-Job
 
# Cleanup of jobs
Remove-Job *
 
# Displays batch completed
echo "Provisioning VM Completed"