<#
.SYNOPSIS
    This PowerShell script ensures that Standard user accounts must not be granted elevated privileges when installing applications as
    it can allow malicious persons and applications to gain full control of a system.

.NOTES
    Author          : Chris Eben
    LinkedIn        : https://www.linkedin.com/in/ashuchris/
    GitHub          : github.com/ashuchris
    Date Created    : 2026-09-08
    Last Modified   : 2026-09-08
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000315

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN11-CC-000315.ps1 
#>

# STIG Remediation: Disable AlwaysInstallElevated

$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"
$ValueName = "AlwaysInstallElevated"
$ValueData = 0

# Create the registry path if it does not exist
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# Set AlwaysInstallElevated to DWORD 0
New-ItemProperty `
    -Path $RegistryPath `
    -Name $ValueName `
    -PropertyType DWord `
    -Value $ValueData `
    -Force | Out-Null

Write-Host "STIG remediation complete: AlwaysInstallElevated = 0"

#verify remediation 

Get-ItemProperty `
    -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer" `
    -Name "AlwaysInstallElevated"
