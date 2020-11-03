@echo off
:starter
set /P v1="Eingabe: "

if "%v1%" LEQ 3 echo ist kleiner oder gleich 3&&goto starter
echo Die Zahl ist größer als  3

pause >NUL