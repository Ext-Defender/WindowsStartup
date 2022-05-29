write-host "*** Initial app install for core tools and packages ***"

write-host "*** Installing Choco ***"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

write-host "*** Configure chocolatey ***"
choco feature enable -n allowGlobalConfirmation

write-host "*** Beginning install ***"
choco upgrade wsl2 python git vscode openssh netcat nmap wireshark burp-suite-pro-edition heidisql sysinternals putty golang neo4j-community openjdk

write-host "*** Build complete, restoring GlobalConfirmation policy. ***"
choco feature disable -n allowGlobalConfirmation

write-host "*** Adding exclusions to WD ***"
#Change Me
add-MpPreference -ExclusionsPath "C:\Users\User\AppData\Local\Temp\chocolatey"
add-MpPreference -ExclusionsPath "C:\Users\User\Documents\git-repos"
add-MpPreference -ExclusionsPath "C:\Users\User\Documents\scripts"

write-host "*** Installing PSWindowsUpdate ***"
Install-Module PSWindowsUpdate

write-host "*** Importing PSWindowsUpdate ***"
Import-Module PSWindowsUpdate

write-host "*** Updating windows ***"
Install-WindowsUpdate -AcceptAll
