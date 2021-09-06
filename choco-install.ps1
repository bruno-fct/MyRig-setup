# Install script for Chocolatey&Apps
# Created 06.09.21

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

ECHO Configure chocolatey
choco feature enable -n allowGlobalConfirmation

ECHO Installing Chocolatey apps

# DEV
choco install vscode
choco install nodejs.install
choco install git

# DEVOPS
choco install filezilla 
choco install putty 

#Misc
choco install 7zip 
choco install adobereader

# Browsers
choco install google-chrome-x64
choco install brave
choco install firefox

# Optional
#choco install windowsazurepowershell

choco feature disable -n allowGlobalConfirmation

ECHO Installing Windows Store Apps
Add-AppxPackage 19282JackieLiu.Notepads-Beta
Add-AppxPackage Microsoft.WindowsTerminal

ECHO Removing Windows Store Apps
Remove-AppxPackage Microsoft.ZuneMusic
Remove-AppxPackage Microsoft.MicrosoftSolitaireCollection
Remove-AppxPackage Microsoft.Office.OneNote
Remove-AppxPackage Microsoft.MicrosoftOfficeHub
Remove-AppxPackage Microsoft.WindowsFeedbackHub

ECHO Installing WSL Ubuntu v20
wsl --install -d Ubuntu-20.04
