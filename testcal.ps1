$username = "syadav2@rms.com"
$password = Get-Content C:\Temp\o365\word1.txt
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $username,$securePassword
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $credential -Authentication Basic -AllowRedirection
Import-PSSession $Session -AllowClobber
Get-MailboxFolderPermission -identity $env:userid':\calendar' | Select Identity, User, AccessRights, FolderName
Get-PSSession | Remove-PSSession
Remove-PSSession $Session
Remove-Variable * -ErrorAction SilentlyContinue
