# printer-heal.ps1
param([string]$Connection="\\print01\Xerox-Floor1")
Stop-Service spooler -Force
$spool = Join-Path $env:WINDIR "System32\spool\PRINTERS"
Remove-Item "$spool\*" -Force -ErrorAction SilentlyContinue
Start-Service spooler
$printerName = Split-Path $Connection -Leaf
Get-Printer | Where-Object Name -eq $printerName | Remove-Printer -ErrorAction SilentlyContinue
Add-Printer -ConnectionName $Connection
rundll32 printui.dll,PrintUIEntry /k /n $printerName
Write-Host "Done."
