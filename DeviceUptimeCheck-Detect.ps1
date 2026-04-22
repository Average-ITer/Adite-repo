<#
.SYNOPSIS
    Controleert of de uptime van het device langer is dan het opgegeven aantal dagen.
.DESCRIPTION
    Dit script berekent de uptime van het device en vergelijkt deze met het opgegeven aantal dagen.
    Als de uptime langer is, retourneert het script exit code 1 (remediation nodig).
.NOTES
    Auteur: Sam T.
    Datum: 22-04-2026
#>

# Aantal dagen uptime waarna een reboot nodig is
$maxUptimeDays = 7

# Haal de uptime van het device op
$os = Get-WmiObject Win32_OperatingSystem
$lastBootUpTime = $os.LastBootUpTime
$uptime = (Get-Date) - $lastBootUpTime

# Controleer of de uptime langer is dan $maxUptimeDays
if ($uptime.TotalDays -gt $maxUptimeDays) {
    Write-Host "Uptime is langer dan $maxUptimeDays dagen. Reboot nodig."
    exit 1
} else {
    Write-Host "Uptime is korter dan $maxUptimeDays dagen. Geen reboot nodig."
    exit 0
}