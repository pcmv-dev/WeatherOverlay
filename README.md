# WeatherOverlay
A powershell script to download weather information from PirateWeather and output into a text file to use in BlueIris macro for weather overlay

## Setup
1. Create your own API key by signing up at [PirateWeather](https://pirateweather.net/)
2. Download the script and place it in BlueIris install folder
3. Edit the script and change the API key and input your location (use [Google Maps](https://maps.google.com) to find your latitude and longitude).
4. By default the weather updates every 30min this can be changed by editing "Start-Sleep -Seconds 1800" and changing the number of seconds
5. By default powershell scripts are blocked. This can be changed by inputing ```Set-ExecutionPolicy Unrestricted``` (Open Powershell as Admin)
6. Check the script works by executing it in terminal ```.\pirateweather.ps1``` (A weather.txt should be created with current weather)
7. Create a Scheduled Task using powershell with arguments ```-windowstyle hidden -file "C:\BlueIris\pirateweather.ps1"```
