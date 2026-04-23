<#
.SYNOPSIS
    Voert een reboot uit als de uptime van het device langer is dan het opgegeven aantal dagen,
    maar geeft de gebruiker eerst 15 minuten de tijd om werk op te slaan.
.DESCRIPTION
    Dit script berekent de uptime van het device en voert een reboot uit als de uptime langer is dan het opgegeven aantal dagen.
    De gebruiker krijgt een waarschuwing en 15 minuten de tijd om werk op te slaan.
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
    Write-Host "Uptime is langer dan $maxUptimeDays dagen. Reboot wordt gepland over 15 minuten..."

    # Toon een melding aan de gebruiker
    $wshell = New-Object -ComObject WScript.Shell
    $wshell.Popup("Uw device wordt over 15 minuten herstart om de prestaties te optimaliseren. Sla uw werk op en sluit uw programma's.", 0, "Geplande Reboot", 0x40)

    # Wacht 15 minuten (900 seconden)
    Start-Sleep -Seconds 900

    # Voer de reboot uit
    Restart-Computer -Force
} else {
    Write-Host "Uptime is korter dan $maxUptimeDays dagen. Geen reboot nodig."
}
# Gewoon een comment