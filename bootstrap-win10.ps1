if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

choco upgrade -y thunderbird pycharm rubymine whatsapp docker-desktop hyper vim steam git git-lfs firacode-ttf slack vcxsrv nodejs.install visualstudio2017buildtools
choco upgrade -y etcher autohotkey virtualbox winrar virtualbox.extensionpack hwmonitor intelpowergadget adobereader cpu-z jdk8 rocketchat hwinfo 
choco upgrade -y vlc cmake openssl vscode libreoffice-fresh postman discord octave pyenv-win vagrant nextcloud-client lein
choco install -y mysql --version=5.7.18
choco install -y anaconda3 --params /AddToPath

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

if(!(Test-Path ~/Ubuntu/ubuntu2004.appx)) {
  Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile ~/Ubuntu.appx -UseBasicParsing
  Rename-Item ~/Ubuntu.appx Ubuntu.zip
  Expand-Archive ~/Ubuntu.zip ~/Ubuntu
  ~/Ubuntu/ubuntu2004.exe
}

if(!(Test-Path ~/tridactyl.xpi)) {
  Invoke-WebRequest -Uri https://tridactyl.cmcaine.co.uk/betas/tridactyl-latest.xpi -OutFile ~/tridactyl.xpi -UseBasicParsing
  Start-Process firefox ~/tridactyl.xpi
}

Read-Host 'Press Enter to continue…' | Out-Null

