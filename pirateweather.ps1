do
{
    $timeStamp = Get-Date -DisplayHint Time
    $processBlueIris = Get-Process -Name BlueIris -ErrorAction SilentlyContinue
    if ($processBlueIris)
    {
        $apiKey = "API_KEY"
        $location = "LATITUDE,LONGITUDE"
        $pirateUrl = "https://api.pirateweather.net/forecast/$($apiKey)/$($location)?exclude=minutely,hourly,daily,alerts&units=us"
        $pirateWeather = Invoke-RestMethod "$pirateUrl"
        $pirateWeather | ConvertTo-Json -depth 100
        $pirateWind = Write-Output $pirateWeather.currently.windSpeed
        $pirateTemp = Write-Output $pirateWeather.currently.temperature
        $roundTemp = [math]::Round($pirateTemp)
        $roundWind = [math]::Round($pirateWind)
        $CurrentWeather = Write-Output "Cond: $($pirateWeather.currently.summary) | Temp: $($roundTemp)°F | Wind: $($roundWind) mp/h"
        $CurrentWeather | Out-File "C:\BlueIris\weather.txt" -Encoding UTF8
        Write-Output -InputObject "Last Updated: $($timeStamp)"
    }else {
        Write-Output "BlueIris Not Running. Stopping Script"; exit
    }
    Start-Sleep -Seconds 1800
}
until (-not $processBlueIris); Write-Output "BlueIris Not Running. Stopping Script"