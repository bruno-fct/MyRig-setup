# Install script for Chocolatey & Apps
# Created 06.09.21

ECHO "Configure chocolatey"
choco feature enable -n allowGlobalConfirmation

ECHO "Installing Chocolatey apps"

# DEV
choco install vscode
choco install nodejs.install
choco install git

# DEVOPS
choco install filezilla 
choco install putty 

# Support
choco install teamviewer 
choco install anydesk

#Misc
choco install 7zip 
choco install adobereader

# Browsers
choco install google-chrome-x64
choco install brave
choco install firefox

# Optional
choco install windowsazurepowershell
choco install microsoft-teams

choco feature disable -n allowGlobalConfirmation

ECHO "Installing Windows Store Apps"
Add-AppxPackage "19282JackieLiu.Notepads-Beta"
Add-AppxPackage "Microsoft.WindowsTerminal"

ECHO "Removing Windows Store Apps"
Remove-AppxPackage "Microsoft.ZuneMusic"
Remove-AppxPackage "Microsoft.MicrosoftSolitaireCollection"
Remove-AppxPackage "Microsoft.Office.OneNote"
Remove-AppxPackage "Microsoft.MicrosoftOfficeHub"
Remove-AppxPackage "Microsoft.WindowsFeedbackHub"

ECHO "Configuring Windows"
ECHO "Configuring Power Plan"
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
$p = gwmi -NS root\cimv2\power -Class win32_PowerPlan -Filter "ElementName ='Power Saver'"
$p.Activate()

ECHO "Configuring Proxy, Taskbar and UAC"
Disable-NetProxy
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0
Set-ItemProperty -Path REGISTRY::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search - Name SearchboxTaskbar -Value 0
New-ItemProperty -Path REGISTRY::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced - Name ShowCortanaButton -Value 0
Set-ItemProperty -Path REGISTRY::HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced - Name ShowTaskViewButton -Value 0
Set-ItemProperty -Path REGISTRY::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Feeds - Name ShellFeedsTaskbarViewMode -Value 2
New-ItemProperty -Path REGISTRY::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies - Name HideSCAMeetNow -Value 1

ECHO "Configuring Windows Update"
Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc -Name Start -Value 4

ECHO "Installing WSL Ubuntu v20"
wsl --install -d Ubuntu-20.04
