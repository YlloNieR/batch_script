:: Windows Update Schritt 1.1.
powershell -Command "Set-ExecutionPolicy Bypass -Scope Process -Force"
echo ...setze policiy process auf bypass
powershell -Command "Install-Module PSWindowsUpdate -Force"
echo ...setze downloade windows updates
powershell -Command "Get-WindowsUpdate -acceptall"
echo ...installiere windows updates & starte im Anschluss (wenn notwendig) neu
powershell -Command "Install-WindowsUpdate -acceptall -autoreboot"
:: Neustart

:: Windows Update Schritt 1.2.
echo echo ...setze policiy process auf undefined
powershell -Command "Set-ExecutionPolicy Undefined -Scope Process -Force"
echo echo ...setze policiy LocalMachine auf Restricted
powershell -Command "Set-ExecutionPolicy Restricted -Scope LocalMachine -Force"