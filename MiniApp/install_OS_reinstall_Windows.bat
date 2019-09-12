@echo off

echo.
echo Installationsprogramm fuer den Fall das dass OS erneut aufgesetzt werden muss
echo.
echo Hinweis: Downloadort ist dort wo sich Batch Datei befindet!
echo.
echo Hier die Auswahl:
echo.
echo 0 = Beendet installProgProg.bat
echo.
echo 1 = alle Programme installieren
echo.
echo 2 = Chrome
echo 3 = WinRAR V.5.71
echo 4 = Backup and Sync from Google
echo 5 = Canon Quick Menu V.2.8.5
echo 6 = CanoScan LiDE 220 Scanner Driver V.1.03
echo 7 = KeePass Password Safe V.2.43
echo 8 = VeraCrypt V.1.23
echo 9 = WD Quick View
echo.

:nochEine
set /p id="Welche Anwendungen moechtest du installieren?: "

:: 0 = Beendet installProgProg.bat
if "%id%" == "0" (
    call :beendet_installProgProg
    exit /b %ERRORLEVEL%
)

:: 1 = Alle Programme installieren
if "%id%" == "1" (
    echo alle Programme werden installiert...
    ::2 = Chrome
    echo Starte Download Chrome...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7BFA610FCA-4A4E-394F-14BF-E3DA6ABCC9F6%7D%26lang%3Dde%26browser%3D4%26usagestats%3D1%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe', 'ChromeSetup.exe)"
    echo Starte Installation...
    start ChromeSetup.exe

    ::3 = WinRAR V.5.71
    echo Starte Download WinRAR V.5.71 ...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://www.netzmechanik.de/dl/4/winrar-x64-571d.exe', 'winrar-x64-571d.exe')"
    echo Starte Installation...
    start winrar-x64-571d.exe   
	
    ::4 = Backup and Sync from Google
    echo Starte Download Backup and Sync from Google ...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://dl.google.com/tag/s/appguid%3D%7B3C122445-AECE-4309-90B7-85A6AEF42AC0%7D%26iid%3D%7B9648D435-67BA-D2A7-54D2-1E0B5656BF03%7D%26ap%3Duploader%26appname%3DBackup%2520and%2520Sync%26needsadmin%3Dtrue/drive/installbackupandsync.exe', 'installbackupandsync.exe')"
    echo Starte Installation...
    start installbackupandsync.exe   
	
    ::5 = Canon Quick Menu V.2.8.5
    echo Starte Download Canon Quick Menu V.2.8.5 ...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('http://gdlp01.c-wss.com/gds/4/0200004874/04/qm__-win-2_8_5-ea31_2.exe', 'qm__-win-2_8_5-ea31_2.exe')"
    echo Starte Installation...
    start qm__-win-2_8_5-ea31_2.exe 
	
    ::6 = CanoScan LiDE 220 Scanner Driver V.1.03
    echo Starte Download CanoScan LiDE 220 Scanner Driver V.1.03 ...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('http://gdlp01.c-wss.com/gds/6/0100006026/04/sc68-win-lide220-1_03-ea33_3.exe', 'sc68-win-lide220-1_03-ea33_3.exe')"
    echo Starte Installation...
    start sc68-win-lide220-1_03-ea33_3.exe   
	
    ::7 = KeePass Password Safe V.2.43 
    echo Starte Download KeePass-2.43-Setup.exe ...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://netix.dl.sourceforge.net/project/keepass/KeePass%202.x/2.43/KeePass-2.43-Setup.exe', 'KeePass-2.43-Setup.exe')"
    echo Starte Installation...
    start KeePass-2.43-Setup.exe   
	
    ::8 = VeraCrypt V.1.23
    echo Starte Download VeraCrypt V.1.23 ...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://launchpadlibrarian.net/398872784/VeraCrypt%20Setup%201.23-Hotfix-2.exe', 'VeraCrypt Setup 1.23-Hotfix-2.exe')"
    echo Starte Installation...
    start VeraCrypt Setup 1.23-Hotfix-2.exe   
	
    ::9 = WD Quick View
    echo Starte Download WD Quick View ...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://downloads.wdc.com/nas/WD_Quick_View_Setup_for_Windows.zip', 'WD_Quick_View_Setup_for_Windows.zip')"
    echo Entpacke .zip Paket...
    ::ENTPACKEN!!! start WD_Quick_View_Setup_for_Windows.zip   
    echo Starte Installation...
		
	call :beendet_installProgProg
    exit /b %ERRORLEVEL%
)


:: 2 = Chrome
if "%id%" == "2" (    
    echo "2 = Chrome" wird installiert... 
    ::Starte Download
    echo Starte Download...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7BFA610FCA-4A4E-394F-14BF-E3DA6ABCC9F6%7D%26lang%3Dde%26browser%3D4%26usagestats%3D1%26appname%3DGoogle%2520Chrome%26needsadmin%3Dprefers%26ap%3Dx64-stable-statsdef_1%26installdataindex%3Dempty/update2/installers/ChromeSetup.exe', 'ChromeSetup.exe')"
    ::Starte Installation
    echo Starte Installation...
    start installbackupandsync.exe
    goto :nochEine
)

:: 3 = WinRAR V.5.71
if "%id%" == "3" (    
    echo "3 = WinRAR V.5.71" wird installiert... 
    ::Starte Download
    echo Starte Download...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://www.netzmechanik.de/dl/4/winrar-x64-571d.exe', 'winrar-x64-571d.exe')"
    ::Starte Installation
    echo Starte Installation...
    start winrar-x64-571d.exe
    goto :nochEine
)

:: 4 = Backup and Sync from Google
if "%id%" == "4" (    
    echo "4 = Backup and Sync from Google" wird installiert... 
    ::Starte Download
    echo Starte Download...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://dl.google.com/tag/s/appguid%3D%7B3C122445-AECE-4309-90B7-85A6AEF42AC0%7D%26iid%3D%7B9648D435-67BA-D2A7-54D2-1E0B5656BF03%7D%26ap%3Duploader%26appname%3DBackup%2520and%2520Sync%26needsadmin%3Dtrue/drive/installbackupandsync.exe', 'installbackupandsync.exe')"
    ::Starte Installation
    echo Starte Installation...
    start installbackupandsync.exe
    goto :nochEine
)

:: 5 = Canon Quick Menu V.2.8.5
if "%id%" == "5" (    
    echo "5 = Canon Quick Menu V.2.8.5" wird installiert... 
    ::Starte Download
    echo Starte Download...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('http://gdlp01.c-wss.com/gds/4/0200004874/04/qm__-win-2_8_5-ea31_2.exe', 'qm__-win-2_8_5-ea31_2.exe')"
    ::Starte Installation
    echo Starte Installation...
    start qm__-win-2_8_5-ea31_2.exe
    goto :nochEine
)

:: 6 = CanoScan LiDE 220 Scanner Driver V.1.03
if "%id%" == "6" (    
    echo "sc68-win-lide220-1_03-ea33_3.exe" wird installiert... 
    ::Starte Download
    echo Starte Download...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('http://gdlp01.c-wss.com/gds/6/0100006026/04/sc68-win-lide220-1_03-ea33_3.exe', 'sc68-win-lide220-1_03-ea33_3.exe')"
    ::Starte Installation
    echo Starte Installation...
    start sc68-win-lide220-1_03-ea33_3.exe
    goto :nochEine
)

:: 7 = KeePass Password Safe V.2.43
if "%id%" == "7" (    
    echo "7 = KeePass Password Safe V.2.43" wird installiert... 
    ::Starte Download
    echo Starte Download...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://netix.dl.sourceforge.net/project/keepass/KeePass%202.x/2.43/KeePass-2.43-Setup.exe', 'KeePass-2.43-Setup.exe')"
    ::Starte Installation
    echo Starte Installation...
    start KeePass-2.43-Setup.exe
    goto :nochEine
)

:: 8 = VeraCrypt V.1.23
if "%id%" == "8" (    
    echo "8 = VeraCrypt V.1.23" wird installiert... 
    ::Starte Download
    echo Starte Download...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://launchpadlibrarian.net/398872784/VeraCrypt%20Setup%201.23-Hotfix-2.exe', 'VeraCrypt Setup 1.23-Hotfix-2.exe')"
    ::Starte Installation
    echo Starte Installation...
    start VeraCrypt Setup 1.23-Hotfix-2.exe
    goto :nochEine
)

:: 9 = WD Quick View
if "%id%" == "9" (    
    echo "9 = WD Quick View" wird installiert... 
    ::Starte Download
    echo Starte Download...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://downloads.wdc.com/nas/WD_Quick_View_Setup_for_Windows.zip', 'WD_Quick_View_Setup_for_Windows.zip')"
    ::Starte Installation
    echo Entpacke .zip Paket...
    ::ENTPACKEN!!! start WD_Quick_View_Setup_for_Windows.zip   
    echo Starte Installation...
    goto :nochEine
)




::speariert Funktionen vom Hauptprogramm
exit /b %ERRORLEVEL%

:beendet_installProgProg
echo Loesche Installationsdateien...
del "ChromeSetup.exe" /f /q
del "winrar-x64-571d.exe" /f /q
del "installbackupandsync.exe" /f /q
del "qm__-win-2_8_5-ea31_2.exe" /f /q
del "sc68-win-lide220-1_03-ea33_3.exe" /f /q
del "KeePass-2.43-Setup.exe" /f /q
del "VeraCrypt Setup 1.23-Hotfix-2.exe" /f /q
del "WD_Quick_View_Setup_for_Windows.zip" /f /q

echo.
echo Installation & Löschvorgang abgeschlossen ;)
echo.
echo Bye Bye
exit /b

::pause >NUL