# Enter the storage account details
$storageAccountName = "deniedaccount"
$storageAccountKey = "PASTE_STORAGE_ACCOUNT_KEY_HERE"

# Convert storage key to secure string
$secureKey = ConvertTo-SecureString -String $storageAccountKey -AsPlainText -Force

# Create storage account credential
$credential = New-Object System.Management.Automation.PSCredential `
    -ArgumentList ("Azure\$storageAccountName"), $secureKey

# Attempt to map Azure File Share drive
New-PSDrive `
    -Name Z `
    -PSProvider FileSystem `
    -Root "\\$storageAccountName.file.core.windows.net\file-share" `
    -Credential $credential