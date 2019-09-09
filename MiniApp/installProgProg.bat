@echo off
:: MERKE:
:: 1. falls Dateinamen "()" enthalten ändern in "-" oder sonstiges --> bug
:: 2. falls echo texte mit klammern versehen sind ggf in "" einbetten
:: 3. Ausführort der batch = Speicherort der DL, außer Änderung bei ... 'http://download.url/here.exe', 'C:\destination\here.exe')

echo.
echo Installationsprogramm fuer alle Programmierandendungen
echo.
echo Hinweis: Downloadort ist dort wo sich Batch Datei befindet!
echo.
echo Hier die Auswahl:
echo.
echo 0 = Beendet installProgProg.bat
echo.
echo 1 = alle Programme installieren
echo.
echo 2 = Git V. 2.21.0
echo 3 = GitHub Desktop V.latest
echo 4 = Microsoft Visual Studio Code V.latest
echo 5 = Notepad ++ V7.7.1
echo 6 = Python V.3.7.4
echo 7 = Rakudo Star V.2019.03 (Perl)
echo 8 = Strawberry Perl V.5.30.0.1
echo 9 = XAMPP V.7.3.9 (Apache + MariaDB + PHP + Perl)
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
    ::Git-2.23.0-64-bit.exe
    echo Starte Download Git-2.23.0-64-bit.exe...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/git-for-windows/git/releases/download/v2.23.0.windows.1/Git-2.23.0-64-bit.exe', 'Git-2.23.0-64-bit.exe')"
    echo Starte Installation...
    start Git-2.23.0-64-bit.exe

    ::GitHubDesktopSetup.exe
    echo Starte Download GitHubDesktopSetup.exe...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://central.github.com/deployments/desktop/desktop/latest/win32', 'GitHubDesktopSetup.exe')"
    echo Starte Installation...
    start GitHubDesktopSetup.exe   
	
	::VSCodeUserSetup-x64-1.38.0.exe
    echo Starte Download VSCodeUserSetup-x64-1.38.0.exe...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://aka.ms/win32-x64-user-stable', 'VSCodeUserSetup-x64-1.38.0.exe')"
    echo Starte Installation...
    start VSCodeUserSetup-x64-1.38.0.exe
	
    ::Starte Download npp.7.7.1.Installer.exe
    echo Starte Download npp.7.7.1.Installer.exe...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://notepad-plus-plus.org/repository/7.x/7.7.1/npp.7.7.1.Installer.exe', 'npp.7.7.1.Installer.exe')"
    echo Starte Installation...
    start npp.7.7.1.Installer.exe
	
    ::Starte Download python-3.7.4.exe
    echo Starte Download python-3.7.4.exe...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://www.python.org/ftp/python/3.7.4/python-3.7.4.exe', 'python-3.7.4.exe')"
    echo Starte Installation...
    start python-3.7.4.exe
	
    ::Starte Download rakudo-star-2019.03-x86_64(JIT).msi
    echo Starte Download "rakudo-star-2019.03-x86_64(JIT).msi"...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://rakudo.org/latest/star/win64', 'rakudo-star-2019.03-x86_64_JIT_.msi')"
    echo Starte Installation...
    start rakudo-star-2019.03-x86_64_JIT_.msi
	
    ::Starte Download strawberry-perl-5.30.0.1-64bit.msi
    echo Starte Download "strawberry-perl-5.30.0.1-64bit.msi"...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('http://strawberryperl.com/download/5.30.0.1/strawberry-perl-5.30.0.1-64bit.msi', 'strawberry-perl-5.30.0.1-64bit.msi')"
    echo Starte Installation...
    start strawberry-perl-5.30.0.1-64bit.msi
	
    ::Starte Download xampp-windows-x64-7.3.9-0-VC15-installer.exe
    echo Starte Download xampp-windows-x64-7.3.9-0-VC15-installer.exe...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://www.apachefriends.org/xampp-files/7.3.9/xampp-windows-x64-7.3.9-0-VC15-installer.exe', 'xampp-windows-x64-7.3.9-0-VC15-installer.exe')"
    echo Starte Installation...
    start xampp-windows-x64-7.3.9-0-VC15-installer.exe

    call :beendet_installProgProg
    exit /b %ERRORLEVEL%
)


:: 2 = Git V. 2.21.0
if "%id%" == "2" (    
    echo "Git" V. 2.21.0 wird installiert... 
    ::Starte Download
    echo Starte Download...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/git-for-windows/git/releases/download/v2.23.0.windows.1/Git-2.23.0-64-bit.exe', 'Git-2.23.0-64-bit.exe')"
    ::Starte Installation
    echo Starte Installation...
    start Git-2.23.0-64-bit.exe
    goto :nochEine
)


:: 3 = GitHub Desktop V.latest
if "%id%" == "3" (
    echo "GitHub Desktop" V.latest wird installiert... 
    ::Starte Download
    echo Starte Download...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://central.github.com/deployments/desktop/desktop/latest/win32', 'GitHubDesktopSetup.exe')"
    ::Starte Installation
    echo Starte Installation...
    start GitHubDesktopSetup.exe
    goto :nochEine
)


:: 4 = Microsoft Visual Studio Code V.latest
if "%id%" == "4" (
    echo "Microsoft Visual Studio Code" V.latest wird installiert... 
    ::Starte Download
    echo Starte Download...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://aka.ms/win32-x64-user-stable', 'VSCodeUserSetup-x64-1.38.0.exe')"
    ::Starte Installation
    echo Starte Installation...
    start VSCodeUserSetup-x64-1.38.0.exe
    goto :nochEine
)


:: 5 = Notepad ++ V7.7.1
if "%id%" == "5" (
    echo "Notepad ++" V7.7.1 wird installiert... 
    ::Starte Download
    echo Starte Download...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://notepad-plus-plus.org/repository/7.x/7.7.1/npp.7.7.1.Installer.exe', 'npp.7.7.1.Installer.exe')"
    ::Starte Installation
    echo Starte Installation...
    start npp.7.7.1.Installer.exe
    goto :nochEine
)


::  6 = Python V.3.7.4
if "%id%" == "6" (
    echo "Python" V.3.7.4 wird installiert... 
    ::Starte Download
    echo Starte Download...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://www.python.org/ftp/python/3.7.4/python-3.7.4.exe', 'python-3.7.4.exe')"
    ::Starte Installation
    echo Starte Installation...
    start python-3.7.4.exe
    goto :nochEine
)


:: 7 = Rakudo Star V.2019.03 (Perl)
if "%id%" == "7" (
    echo "Rakudo Star (Perl)" V.2019.03 wird installiert... 
    ::Starte Download
    echo Starte Download...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://rakudo.org/latest/star/win64', 'rakudo-star-2019.03-x86_64_JIT_.msi')"
    ::Starte Installation
    echo Starte Installation...
    start rakudo-star-2019.03-x86_64_JIT_.msi
    goto :nochEine
) 


:: 8 = Strawberry Perl V.5.30.0.1
if "%id%" == "8" (
    echo "Strawberry Perl" V.5.30.0.1 wird installiert... 
    ::Starte Download
    echo Starte Download...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('http://strawberryperl.com/download/5.30.0.1/strawberry-perl-5.30.0.1-64bit.msi', 'strawberry-perl-5.30.0.1-64bit.msi')"
    ::Starte Installation
    echo Starte Installation...
    start strawberry-perl-5.30.0.1-64bit.msi
    goto :nochEine
)


:: 9 = XAMPP V.7.3.9 (Apache + MariaDB + PHP + Perl)
if "%id%" == "9" (
    echo "XAMPP (Apache + MariaDB + PHP + Perl)" V.7.3.9 wird installiert... 
    ::Starte Download
    echo Starte Download...
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://www.apachefriends.org/xampp-files/7.3.9/xampp-windows-x64-7.3.9-0-VC15-installer.exe', 'xampp-windows-x64-7.3.9-0-VC15-installer.exe')"
    ::Starte Installation
    echo Starte Installation...
    start xampp-windows-x64-7.3.9-0-VC15-installer.exe
    goto :nochEine
)


::speariert Funktionen vom Hauptprogramm
exit /b %ERRORLEVEL%

:beendet_installProgProg
echo Loesche Installationsdateien...
:: 2 = Git V. 2.21.0
del "Git-2.23.0-64-bit.exe" /f /q
:: 3 = GitHub Desktop V.latest
del "GitHubDesktopSetup.exe" /f /q
:: 4 = Microsoft Visual Studio Code V.latest
del "VSCodeUserSetup-x64-1.38.0.exe" /f /q
:: 5 = Notepad ++ V7.7.1
del "npp.7.7.1.Installer.exe" /f /q
::  6 = Python V.3.7.4
del "python-3.7.4.exe" /f /q
:: 7 = Rakudo Star V.2019.03 (Perl)
del "rakudo-star-2019.03-x86_64_JIT_.msi" /f /q
:: 8 = Strawberry Perl V.5.30.0.1
del "strawberry-perl-5.30.0.1-64bit.msi" /f /q
:: 9 = XAMPP V.7.3.9 (Apache + MariaDB + PHP + Perl)
del "xampp-windows-x64-7.3.9-0-VC15-installer.exe" /f /q
echo.
echo Installation & Löschvorgang abgeschlossen ;)
echo.
echo Bye Bye
exit /b

::pause >NUL