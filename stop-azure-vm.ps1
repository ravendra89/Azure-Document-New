$ResourceGroupName = "Runbook Name"
$VMName            = "VM Name"
$SubscriptionId    = "SubscriptionId"

Write-Output "Connecting to Azure..."
Connect-AzAccount -Identity

Write-Output "Setting subscription context..."
Set-AzContext -SubscriptionId $SubscriptionId

Write-Output "Stopping VM '$VMName' in resource group '$ResourceGroupName'..."
Stop-AzVM -ResourceGroupName $ResourceGroupName -Name $VMName -Force -NoWait

Write-Output "$VMName has been stopped successfully."