@echo off
echo Speedtest
SET CSVHEADER="Servername","Server ID","Latenz in ms","Laufzeitstreuung in ms","Paketverlust","Download in Mbps","Upload in Mbps","Download bytes","Upload bytes","URL","Datum","Uhrzeit","User Domain"
echo %CSVHEADER% >> Speedtest_LOG.csv
echo.
echo CSV LOG created
echo.
echo 3600 sec = 60 min = 1 h
echo 9000 sec = 150 min = 2,5 h
echo 14400 sec = 240 min = 4 h
echo 21600 sec = 360 min = 6 h
echo 43200 sec = 720 min = 12 h
echo.
set /p TIMEINSEC=Geben Sie den Zeitintervall in Sekunden an: 
set /a i=0
echo Starte Speedtests
:loop
set /a i+=1
echo %i%. Speedtest am %DATE% um %TIME% Uhr in Bearbeitung ...
SET VARDATE=,"%DATE%"
SET VARTIME=,"%TIME%"
SET VARBAUPROJEKT=,%BAUPROJEKT%
SET VARUSERDOMAIN=,%USERDOMAIN%
for /f "skip=1 delims=[]" %%p in ('"C:\Users\%USERNAME%\Documents\Speedtest\speedtest.exe" -f csv --output-header') Do (SET OUTPUTA=%%p)
SET OUTPUTB=%OUTPUTA%%VARDATE%%VARTIME%%VARBAUPROJEKT%%VARUSERDOMAIN%
echo %OUTPUTB% >> Speedtest_LOG.csv
timeout /t %TIMEINSEC%
goto loop