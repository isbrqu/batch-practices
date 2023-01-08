@echo off
setlocal EnableDelayedExpansion
for /f "delims=" %%a in ('"netsh wlan show networks | find /i "ssid""') do (
    set "_result=%%a"
    set "_result=!_result:*: =!"
    echo !_result!
    echo !_result! > temp.ssid
    certutil -encodehex -f temp.ssid temp.hex > nul
    for /f "delims=" %%c in (temp.hex) do (
        set "_hex=%%c"
        set "_hex=!_hex:~5!"
        set "_hex=!_hex:  *=!"
        echo !_hex!
    )
)
