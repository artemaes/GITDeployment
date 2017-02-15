Get-AzureRmLocation | sort DisplayName | Select DisplayName

Get-Module -ListAvailable -Name AzureRm.Resources | Select Version

$PSVersionTable
Add-AzureRMAccount
Get-AzureSubscription

Login-AzureRmAccount

Install-Module AzureRM
Import-Module AzureRM
Install-Module Azure -Force # to install module despite the previous version has been already installed
Import-Module Azure
Install-Module -Name AzureRM.Automation

Get-AzureRmAutomationDscNodeConfiguration

Set-ExecutionPolicy RemoteSigned
Get-ExecutionPolicy

Get-AzureVM
Get-AzureAccount

Select-AzureSubscription -Current -SubscriptionName MSDN Platforms -Account artem_aes@mail.ru 

Get-AzurePublishSettingsFile
Import-AzurePublishSettingsFile –PublishSettingsFile d:\PowerShell\Azure\MSDN Platforms-2-7-2017-credentials.publishsettings

Get-Module -ListAvailable Azure* # the list of available moduels

New-AzureRmResourceGroup -Name "ArtResGroup" -Location "Central US"

#Test-AzureRmResourceGroupDeployment -ResourceGroupName ARTResGroup -TemplateFile C:\Users\artyom_kovaltsov\Documents\WindowsPowerShell\Templates\W2k12DCR2\template.json
New-AzureRmResourceGroup -Name "ArtResGroup" -Location "Central US"
New-AzureRmStorageAccount -ResourceGroupName "ArtResGroup" -AccountName "artresgroupdisks311" -Location "Central US" -Type "Premium_LRS"
Login-AzureRmAccount
New-AzureRmResourceGroupDeployment -Name ArtDeployment -ResourceGroupName ARTResGroup -TemplateFile d:\W2k12DCR2\template.json -TemplateParameterFile d:\W2k12DCR2\parameters.json
#New-AzureRmResourceGroupDeployment -Name ArtDeployment -ResourceGroupName ARTResGroup -TemplateFile d:\W2k12DCR2-Origin\template.json -TemplateParameterFile d:\W2k12DCR2-Origin\parameters.json
#https://artresgroupdiag177.file.core.windows.net/artfileshare1

Remove-AzureRmResourceGroup -Name ARTResGroup -Force

Stop-AzureRmVM -ResourceGroupName "ArtResGroup" -Name "ARTVM" -Force
Remove-AzureRmVM -ResourceGroupName "ArtResGroup" -Name "ARTVM" -Force

New-AzureRmAutomationAccount -Name "ArtAutAcc" -Location "eastus2" -ResourceGroupName "ArtResGroup"
Get-AzureRmAutomationAccount
Remove-AzureRmAutomationAccount
Set-AzureRmAutomationAccount

Start-AzureRmAutomationDscCompilationJob -ResourceGroupName "MyResourceGroup" -AutomationAccountName "MyAutomationAccount" -ConfigurationName "SampleConfig"

Get-AzureVMImage | Select-Object –Property ImageFamily –Unique # | Measure-Object
Get-AzureVMImage | Where-Object {$_.label -like 'Windows Server 2012 R2*'} | Sort-Object -Property PublishedDate -Descending #|Format-Table Label, PublishedDate -AutoSize

New-AzureRmAvailabilitySet -ResourceGroupName ARTResGroup -Name ArtAvailabilitySet01 -Location 'Central US'
Get-AzureRmAvailabilitySet -ResourceGroupName ARTResGroup -Verbose
Get-AzureRmAvailabilitySet -ResourceGroupName "ARTResGroup" -Name "AvailabilitySet03"

#Get-AzureVMAvailableExtension [-ExtensionName] <String> [-Publisher] <String> [-AllVersions] [ <CommonParameters>]

New-AzureRmStorageAccount -ResourceGroupName "ArtResGroup" -AccountName "artresgroupdisks311" -Location "Central US" -Type "Premium_LRS" -Kind "Storage"

New-AzureRmStorageAccount -ResourceGroupName "ArtResGroup" -AccountName "artresgroupdisks311" -Location "Central US" -Type "Premium_LRS" -Kind "Storage"

#Specifies the kind of Storage account that this cmdlet creates. psdx_paramvalues - Storage. General purpose storage account that supports storage of Blobs, Tables, Queues, Files and Disks.

#AzCopy /Source:d:\W2k12DCR2\DSC\ /Dest:https://myaccount.file.core.windows.net/myfileshare/ /DestKey:key /Pattern:ab* /S

PS C:\>New-AzureRmStorageAccount -ResourceGroupName "MyResourceGroup" -AccountName "MyStorageAccount" -Location "US West" -SkuName "Standard_GRS" -EnableEncryptionService Blob -Kind "BlobStorage" -AccessTier Hot

#net use O: \\artresgroupdiag177.file.core.windows.net\artfileshare1 /u:artresgroupdiag177 +nQ5xHp0rXaDjVK8CE8+4RDyYz0mZgyCKuHkSVE1+CYd2B5o64BnOSynNDZSPDikthyfbUUog2t2mfcaKY6Mdg==