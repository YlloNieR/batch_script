@echo off

echo Ist das Ergebnis 2?

set v1=3
set v2=2
set v1=%v2%

if not "%v1%"=="2" echo NEIN&&goto ende
echo Ja
:ende
pause >NUL