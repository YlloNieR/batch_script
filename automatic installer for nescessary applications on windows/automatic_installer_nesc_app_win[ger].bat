@echo off
:: ...stelle um auf UTF8
chcp 65001
cls
SET addBenutzer=Admin
SET passwort=asd
echo.
echo.
powershell write-host -fore blue '################################################################'
powershell write-host -fore blue '##############_____________________________________#############'
powershell write-host -fore blue '##############__Automatische_Computer_Einrichtung__#############'
powershell write-host -fore blue '##############_____________________________________#############'
powershell write-host -fore blue '################################################################'
echo.
echo.
echo.
echo.
powershell write-host -back Red '################################################################'
powershell write-host -back Red '# !!!DIESE INSTALLATION MUSS ALS ADMIN DURCHGEFÜHRT WERDEN!!! ##'
powershell write-host -back Red '################################################################'
echo.
echo Automatische Installation für notwendige Anwendungen auf Windows
echo notwendige Schritte:
echo.
echo         1. Windows Updates installieren (UsInp request)
echo         2. choco Paketmanager installieren
echo         3. Office 365 installieren
echo         4. Microsoft Teams installieren
echo         5. Google Chrome Browser installieren
echo         6. Teamviewer installieren
echo         7. Adobe Reader installieren
echo         8. keepass installieren
echo         9. 7zip installieren
echo        10. Dropbox installieren
echo        11. Kleinigkeiten Änderungen (UsInp request)
echo.
echo _________________________________________________________________
echo.
powershell write-host -fore yellow 'Um die Installation zu starten folgen Sie den Anweisungen...'
pause
echo.
echo.
:: Zeitmessung Konfig1 Beginn
FOR /F "TOKENS=1 eol=/ DELIMS=/ " %%A IN ('DATE/T') DO SET dd=%%A
FOR /F "TOKENS=1,2 eol=/ DELIMS=/ " %%A IN ('DATE/T') DO SET mm=%%B
FOR /F "TOKENS=1,2,3 eol=/ DELIMS=/ " %%A IN ('DATE/T') DO SET yyyy=%%C
SET datum=%yyyy%.%mm%.%dd%
:: Zeitmessung Konfig1 Ende

:: First Doku Line
SET beginn= um %time% Uhr am %dd%%mm%%yyyy%
echo Installationsvorgang gestartet %beginn%

:: Erstelle LogFile
set Day=%Date:~3,2%
set Mth=%Date:~0,2%
set Yr=%Date:~6,4%

for /f "skip=1" %%G IN ('"wmic.exe useraccount where name="%USERNAME%" get sid"') DO (if not defined SID set "SID=%%G" )
SET logfile="\USERS/%USERNAME%\Desktop\%Yr% %Mth% %Day% - Logfile PC Installation %SID%.txt"
echo ################################################################################### > %logfile%
echo. >> %logfile%
echo Installiert %beginn% >> %logfile%
echo. >> %logfile%
echo ################################################################################### >> %logfile%
echo. >> %logfile%
:: Startzeit:
for /F "tokens=1-4 delims=:.," %%a in ("%time%") do (
   set /A "start=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)
:: Zeitmessbereich Beginn
echo.
echo.
echo.
echo 1. Windows Updates installieren
echo.
:: Windows Update Schritt 1.1.
echo ...setze policiy process auf bypass
powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force"
echo.
echo ...downloade windows updates
powershell -Command "Install-Module PSWindowsUpdate -Force"
echo.
echo ...stelle Installer bereit
powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; Get-WindowsUpdate -acceptall"
echo.
echo ...installiere windows updates & starte im Anschluss (wenn notwendig) neu
powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; Install-WindowsUpdate -acceptall -autoreboot"
echo.
:: Neustart

:: Windows Update Schritt 1.2.
echo ...setze policiy process auf undefined
powershell -Command "Set-ExecutionPolicy Undefined -Scope Process -Force"
echo ...setze policiy LocalMachine auf Restricted
powershell -Command "Set-ExecutionPolicy Restricted -Scope LocalMachine -Force"
echo.
powershell write-host -fore yellow 'Falls kein Neustart durchgeführt wird, können Sie den Anweisungen folgen...'
pause
echo.
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo Installierte Programme: >>%logfile%
echo.
echo 2. choco Paketmanager installieren
powershell -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
choco upgrade chocolatey -y
echo    choco >>%logfile%
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo 3. Office 365 installieren
choco install office365business -y
echo    Office 365 Business >>%logfile%
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo 4. Microsoft Teams installieren
choco install microsoft-teams -y
echo    Microsoft Teams >>%logfile%
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo 5. Google Chrome Browser installieren
choco install googlechrome -y
echo    Google Chrome Browser >>%logfile%
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo 6. Teamviewer installieren
choco install teamviewer -y
echo    Teamviewer >>%logfile%
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo 7. Adobe Reader installieren
choco install adobereader -y
echo    AdobeReader >>%logfile%
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo 8. keepass installieren
choco install keepass -y
echo    keepass >>%logfile%
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo 9. 7zip installieren
choco install 7zip -y
echo    7zip >>%logfile%
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo 10. Dropbox installieren
choco install dropbox -y
echo    Dropbox >>%logfile%
echo.
echo ___________________________________ %TIME% _______________________________
echo.
:: letzte Konfiguration
echo ##########################################################################
echo ##################### 11. Kleinigkeiten Änderungen #######################
echo ##########################################################################
echo.
:: policy end settings
echo ...setze policiy process auf undefined
powershell -Command "Set-ExecutionPolicy Undefined -Scope Process -Force"
echo.
echo ___________________________________ %TIME% _______________________________
echo.
:: Setze Berechtigungen für executive Scripts 
echo ...setze policiy LocalMachine auf Restricted
powershell -Command "Set-ExecutionPolicy Restricted -Scope LocalMachine -Force"
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo ...lösche Microsoft Edge Icon von der taskbar & windows explorer Icon
:: Lösche Microsoft Edge Icon von der taskbar & windows explorer Icon
DEL /F /S /Q /A "%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\*"
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo ...lösche Microsoft Edge Icon von der Taskbar in der Registry
:: Lösche Microsoft Edge Icon von der Taskbar in der Registry
echo.
echo ...starte Explorer neu damit og. Änderung in Kraft tritt
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband /F
:: Starte Explorer neu damit og. Änderung in Kraft tritt
taskkill /f /im explorer.exe
start explorer.exe
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo ...lösche Microsoft Edge Icon vom Desktop
:: Lösche Microsoft Edge Icon vom Desktop
DEL "%UserProfile%\Desktop\Microsoft Edge.lnk"
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo ...lösche Microsoft Edge Icon von der Schnellstartleiste
:: Lösche Microsoft Edge Icon von der Schnellstartleiste
DEL "%AppData%\Microsoft\Internet Explorer\Quick Launch\Microsoft Edge.lnk"
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo ...richte Verknüpfung ein auf Dekstop zu Explorer.exe
:: richte Verknüpfung ein auf Dekstop zu Explorer.exe
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%userprofile%\Desktop\Explorer.lnk');$s.TargetPath='explorer';$s.Save()" 
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo ...richte Verknüpfung ein auf Dekstop zu Outlook.exe
:: richte Verknüpfung ein auf Dekstop zu Outlook.exe
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%userprofile%\Desktop\Outlook.lnk');$s.TargetPath='%PROGRAMFILES%\Microsoft Office\root\Office16\OUTLOOK.EXE';$s.Save()" 
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo ...stoppe Onedrive
:: Stoppe Onedrive
cd /d %LOCALAPPDATA%\Microsoft\OneDrive
OneDrive.exe /shutdown
echo ...lösche Reg Eintrag von OneDrive um Autostart zu verhindern
:: Lösche Reg Eintrag von OneDrive um Autostart zu verhindern
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /f /v "OneDrive"
:: um letzten Schrit Rückgängig zu machen
:: reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /f /v "OneDrive" /t REG_SZ /d "\"%LOCALAPPDATA%\Microsoft\OneDrive\OneDrive.exe\" /background"
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo ...downloade Breitbandmessung.exe aber installiere nicht, Datei befindet sich im Pfad %PROGRAMDATA%\chocolatey\lib\
:: downloade Breitbandmessung aber installiere nicht
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://download.breitbandmessung.de/bbm/Breitbandmessung-win.exe', '%PROGRAMDATA%/chocolatey/lib/Breitbandmessung-win.exe')"
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo ...verändere Reg Eintrag für fileextensions visible z.b. asd.txt anstatt nur asd
:: Verändere Reg Eintrag für fileextensions visible z.b. asd.txt anstatt nur asd
REG ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v HideFileExt /t REG_DWORD /d 0 /f 
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo. ...lasse Standard Browser einstellen
echo.
powershell write-host -fore yellow 'Setzen Sie Chrome als Standard Browser, es wird ein Chrome Fenster geöffnet wählen Sie Chrome als Standard Browser verwenden'
start chrome
pause
echo.
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo. >> %logfile%
echo ################################################################################### >> %logfile%
echo. >> %logfile%
echo ...füge MAC Adresen der Logfile hinzu
setlocal enableextensions enabledelayedexpansion
set /a counter=1
for /f "tokens= 1 skip=2 delims= " %%i in ('getmac /nh') do (
    echo MAC !counter! :       %%i >> %logfile%
	set /a counter+=1
)
endlocal
echo. >> %logfile%
echo ################################################################################### >> %logfile%
echo. >> %logfile%
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo                     Systeminfo von %SID% >>%logfile%
echo ...füge Systeminfo der Logfile hinzu
systeminfo >>%logfile%
echo. >> %logfile%
echo ################################################################################### >> %logfile%
echo. >> %logfile%
echo ___________________________________ %TIME% _______________________________
echo.
echo ...erstelle zusätzliches Benutzerkonto(%addBenutzer%)
net user %addBenutzer% %passwort% /add
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo ...füge erstelltem Konto Adminrechte hinzu
net localgroup Administratoren %addBenutzer% /add
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo ...füge alle Konten und SIP Nummern der Logfile hinzu
echo                    Auflistung der Benutzer des Laptops mit SIP >>%logfile%
wmic useraccount list full >> %logfile%
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo ...beende Zeitmessung
:: Zeitmessbereich Ende
:: Endzeit
for /F "tokens=1-4 delims=:.," %%a in ("%time%") do (
   set /A "end=(((%%a*60)+1%%b %% 100)*60+1%%c %% 100)*100+1%%d %% 100"
)
:: berechne Zeitdifferenz
set /A elapsed=end-start
:: berechne Zeitdifferenz Resultat
set /A hh=elapsed/(60*60*100), rest=elapsed%%(60*60*100), mm=rest/(60*100), rest%%=60*100, ss=rest/100, cc=rest%%100
if %mm% lss 10 set mm=0%mm%
if %ss% lss 10 set ss=0%ss%
if %cc% lss 10 set cc=0%cc%
echo Installationsdauer:
echo %hh%:%mm%:%ss%,%cc%
echo.
echo ___________________________________ %TIME% _______________________________
echo.
echo #################################################################
echo #################################################################
echo #################################################################
echo ############# Der Rechner ist fertig konfiguriert ###############
echo #################################################################
echo #################################################################
echo #################################################################
echo.
echo.
pause