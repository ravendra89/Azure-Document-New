$env:chocolateyVersion = '1.4.0'
Write-Output "Install Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Write-Output "Enable choco allowGlobalConfirmation"
choco feature enable -n=allowGlobalConfirmation

Write-Output "Installing NuGet"
Install-PackageProvider -Name NuGet -RequiredVersion 2.8.5.201 -Force

#Write-output "Installing .NET 4.8"
#choco install netfx-4.8

#Write-Output "Install Notepad++"
#choco install notepadplusplus --no-progress -y

#Write-Output "Install Google Chrome"
# choco install googlechrome -y
# Install this version to avoid checksum error
# choco install googlechrome --version=79.0.3945.130 -y
#choco install googlechrome --ignore-checksums --no-progress -y

Write-Output "Installing AWS tools for Powershell"
Install-Module -Name AWSPowerShell -Force

Write-Output "base server config script complete"