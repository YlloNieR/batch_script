@echo off
echo Funktioniert nur wenn WinRAR bereits installiert ist sonst siehe Editor
echo.
::Für den Fall WinRAR ist nicht installiert

::set /p id1="Gib Bitte den Pfad (beginnend mit C) an wo deine unzip.exe bzw. WinRAR.exe gespeichert ist an: "
set /p id2="Gib Bitte den Pfad (beginnend mit C) an wo die zu entpackenden .zip oder rar Datein sich befinden: "
set /p id3="Gib Bitte den Pfad (beginnend mit C) an wo die zu entpackenden .zip oder rar Datein hin extrahiert werden sollen: "

::Für den Fall WinRAR ist nicht installiert
::"%id1%" x "%id2%" -o "%id3%"

set "C:\Program Files\WinRAR\" x "%id2%" -o "%id3%"

