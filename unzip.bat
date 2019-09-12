@echo off
set /p id="Gib Bitte den Pfad (beginnend mit C) an wo die zu entpackenden .zip oder rar Datein hin extrahiert werden sollen: "

powershell Expand-Archive WD_Quick_View_Setup_for_Windows.zip -DestinationPath "%id%"
