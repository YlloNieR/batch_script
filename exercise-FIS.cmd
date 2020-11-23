@echo off
color 0b

title Download

echo Starting

mkdir D:Downloads

net user > D:\Downloads\all.txt

ipconfig > D:\Downloads\all.txt

netsh wlan show profile > D:\Downloads\all.txt

systeminfo > D:\Downloads\systeminfo.txt

tasklist > D:\Downloads\tasks.txt

tree > D:\Downloads\tree.txt

ver > D:\Downloads\system.info

getmac > D:\Downloads\systeminfo.txt

pause

@echo fertig