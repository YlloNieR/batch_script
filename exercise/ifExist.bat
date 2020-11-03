@echo off
:starter
set /P eingabe="Eingabe: "
if exist "C:\xampp\htdocs\Projekte\batch-script\%eingabe%" (
    echo Ich suche nach: %eingabe% in C:\xampp\htdocs\Projekte\batch-script\ und diese Datei ist vorhanden :) 
    ) else (
        echo %eingabe% nicht vorhanden
    )

goto starter
pause > NUL
