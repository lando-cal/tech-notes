[Power Shell](Power_Shell "wikilink") is a shell for
[Windows](Windows "wikilink") operating systems.

C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe

Profile.ps1
-----------

On startup, powershell will run any .ps1 files it finds in the
WindowsPowerShell directory under my documents. There is allegedly a
Profile.ps1 file in there by default.

`$env:Path` `=`
`"c:\Users\dhoherd\Dropbox\GWOS\Scripts;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\"`

Tricks
------

### Restart a remote computer

Restart-Computer remotehostname -Force

### Find a command that matches a substring

`get-command *time*`

### Get help on commands that match a substring

`get-help *time*`

### Show ACLs of the current dir

`get-acl | format-list`

### Show system BIOS information

`Get-WmiObject -ComputerName hostname win32_bios`

### Show object methods

`$foo | Get-Member`

### Browse the registry

`Set-Location HKCU:\Software\Microsoft\Windows\`\
`Get-ChildItem`

### Show top processes

`while (1) { ps | sort -desc cpu | select -first 30; sleep -seconds 1; cls }`

### Browse the Cert store

`Set-Location cert:\CurrentUser\`\
`Get-ChildItem`

### Get a list of stopped services

`Get-Service | Where-Object { $_.Status -eq "Stopped" }`

### Compare two objects

This will only show the lines that are not common:

`Compare-Object $(Get-VIPrivilege -role admin) $(Get-VIPrivilege -role member)`

### Replacement for unix tail

tail filename

`Get-Content [filename] | Select-Object -Last 10`

tail -f

`Get-Content -Path "C:\scripts\test.txt" -Wait`

### Replacement for unix wc

`Get-Content test.csv | Measure-Object -line -word -character`

### Replacement for unix time

`Measure-Command { Sleep 5 }`

### Replacement for unix grep -B2 -A1

`Get-Content test.csv | Select-String "searchstring" -Context 2,1 -CaseSensitive`

See Also
--------

-   <http://poshcode.org/> - Great PSH site
-   [PowerCLI](PowerCLI "wikilink") - [VMware](VMware "wikilink") CLI
    built on PSH
-   <http://support.microsoft.com/kb/968929> - download link for
    PowerShell and extras
-   AD integration through Active Directory Web Services (ADWS) -
    <http://www.microsoft.com/en-us/download/details.aspx?id=2852>
-   Some PSH videos - <http://www.blkmtn.org/TechEd-2012-Videos>

