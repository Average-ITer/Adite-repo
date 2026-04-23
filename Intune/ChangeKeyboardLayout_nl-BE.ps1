# Voeg de Nederlandse (België) taal toe als deze nog niet aanwezig is
$nlBE = Get-WinUserLanguageList | Where-Object { $_.LanguageTag -eq "nl-BE" }
if (-not $nlBE) {
    Add-WinUserLanguageList -LanguageTag nl-BE -Force
}

# Stel de toetsenbordindeling in op Belgisch Nederlands (AZERTY)
$LanguageList = Get-WinUserLanguageList
$LanguageList[0].InputMethodTips.Clear()
$LanguageList[0].InputMethodTips.Add("0813:00000813")  # 0813 is de identifier voor nl-BE (AZERTY)
Set-WinUserLanguageList -LanguageList $LanguageList -Force

Write-Host "Toetsenbordindeling is gewijzigd naar Belgisch Nederlands (AZERTY). Herstart je computer indien nodig."