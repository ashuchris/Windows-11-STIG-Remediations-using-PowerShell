<#
.SYNOPSIS
    When the system resumes from sleep the user must be promted for a password.

.NOTES
    Author          : Chris Eben
    LinkedIn        : https://www.linkedin.com/in/ashuchris/
    GitHub          : github.com/ashuchris
    Date Created    : 2026-09-08
    Last Modified   : 2026-09-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000185

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000185.ps1 
#>

# STIG Remediation: Disable AutoRun

$RegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$ValueName = "NoAutorun"
$ValueData = 1

# Create the registry key if it does not exist
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Create or update the registry value
New-ItemProperty `
    -Path $RegistryPath `
    -Name $ValueName `
    -PropertyType DWord `
    -Value $ValueData `
    -Force | Out-Null

Write-Host "STIG remediation complete: NoAutorun = 1"
