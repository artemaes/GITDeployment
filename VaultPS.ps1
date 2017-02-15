#Requires -Module AzureRM.Profile
#Requires -Module AzureRM.KeyVault

#Login and Select the default subscription if needed
#Login-AzureRmAccount
#Select-AzureRmSubscription -SubscriptionName 'subscription name'

#Change the values below before running the script
$VaultName = 'ARTVault'             #Globally Unique Name of the KeyVault
$VaultLocation = 'Central US'         #Location of the KeyVault
$ResourceGroupName = 'ARTResGroup'      #Name of the resource group for the vault
$ResourceGroupLocation = 'Central US' #Location of the resource group if it needs to be created

New-AzureRmResourceGroup -Name $ResourceGroupName -Location $ResourceGroupLocation -Force

New-AzureRmKeyVault -VaultName $VaultName -ResourceGroupName $ResourceGroupName -Location $VaultLocation -EnabledForTemplateDeployment