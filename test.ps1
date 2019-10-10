Import-Module ActiveDirectory
Get-ADUser -Filter * -Properties * |Export-Csv -path "E:\Saurabh\Jenkins\Output\ADUserdump_$(get-date -f dd-MM-yyyy).csv"
$From = "bug_review@rms.com"
$Attachment = "E:\Saurabh\Jenkins\Output\ADUserdump_$(get-date -f dd-MM-yyyy).csv"
$Subject = "USER DUMP: RMS.COM all users accounts"
$Body = "Please find the attached RMS.COM all users dump"
$SMTPServer = "mailfeca1.rms.com"
$SMTPPort = "25"
Send-MailMessage -From $From -to $env:emailto -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -Attachments $Attachment
