# Define variables
$ResourceGroupName = "Runbook Name"
$VMName            = "VM Name"
$SubscriptionId    = "SubscriptionId"

Write-Output "Connecting to Azure using system-assigned managed identity..."
Connect-AzAccount -Identity

Write-Output "Setting subscription context..."
Set-AzContext -SubscriptionId $SubscriptionId

Write-Output "Starting VM '$VMName' in resource group '$ResourceGroupName'..."
Start-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName

Write-Output "VM '$VMName' has been started successfully."

