@echo off

ipconfig /all

echo Starte ping google
ping www.google.de
tracert www.google.de
start https://172.217.16.131
pause >NUL