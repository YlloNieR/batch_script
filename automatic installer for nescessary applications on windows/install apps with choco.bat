echo 2. choco Paketmanager installieren

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

echo 3. Office 365 installieren

choco install office365business -y

echo 4. Microsoft Teams installieren

choco install microsoft-teams -y

echo 5. Google Chrome Browser installieren

choco install googlechrome -y

echo 6. Teamviewer installieren

choco install teamviewer -y

echo 7. Adobe Reader installieren

choco install adobereader -y

echo 8. keepass installieren

choco install keepass -y

:: policy end settings
echo echo ...setze policiy process auf undefined
powershell -Command "Set-ExecutionPolicy Undefined -Scope Process -Force"
echo echo ...setze policiy LocalMachine auf Restricted
powershell -Command "Set-ExecutionPolicy Restricted -Scope LocalMachine -Force"