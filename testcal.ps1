$User = "env:userid"
$PWord = ConvertTo-SecureString -String "env:password" -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord


$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $credential -Authentication Basic -AllowRedirection
Import-PSSession $Session -AllowClobber
Get-MailboxFolderPermission -identity $env:userid':\calendar' | Select Identity, User, AccessRights, FolderName
Get-PSSession | Remove-PSSession
Remove-PSSession $Session
Remove-Variable * -ErrorAction SilentlyContinue
