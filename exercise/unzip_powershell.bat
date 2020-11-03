@echo off
set /p id1="Gib Bitte den Pfad (beginnend mit C) an wo die zu entpackenden .zip oder rar Datein sich befinden: "
set /p id2="Gib Bitte den Pfad (beginnend mit C) an wo die zu entpackenden .zip oder rar Datein hin extrahiert werden sollen: "

powershell Expand-Archive "%id1%" -DestinationPath "%id2%"