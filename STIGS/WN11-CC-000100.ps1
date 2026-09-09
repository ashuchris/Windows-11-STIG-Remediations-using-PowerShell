<#
.SYNOPSIS
    Prevent downloading print driver packages over HTTP.

.NOTES
    Author          : Chris Eben
    LinkedIn        : https://www.linkedin.com/in/ashuchris/
    GitHub          : github.com/ashuchris
    Date Created    : 2026-09-08
    Last Modified   : 2026-09-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000100

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000100.ps1 
#>

# STIG Remediation: Disable Web-based Plug and Play Downloads
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers"
$ValueName = "DisableWebPnPDownload"
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

Write-Host "STIG remediation complete: DisableWebPnPDownload = 1"
