echo off
echo ################################################ Systeminfo: ################################################### > systeminfo.txt
systeminfo >> systeminfo.txt
echo. >> systeminfo.txt
echo ################################################### getmac: ################################################### >> systeminfo.txt
getmac >> systeminfo.txt
echo. >> systeminfo.txt
echo ################################################# pingtest: ################################################### >> systeminfo.txt
ping google.de >> systeminfo.txt
ping localhost >> systeminfo.txt
echo ipcfonig / all >> systeminfo.txt
ipconfig /all >> systeminfo.txt
echo. >> systeminfo.txt
echo ############################################################################################################### >> systeminfo.txt
