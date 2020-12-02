echo off

set /p name=type your name:
echo ------------------------------------------------------ >> infoList.txt
echo             %name%  >> infoList.txt
echo ------------------------------------------------------ >> infoList.txt
echo Userdomain: %USERDOMAIN%\ >> infoList.txt
echo Username:   %USERNAME% >> infoList.txt

for /f "tokens= 1 skip=2 delims= " %%v in ('getmac /nh') do (
    echo MAC :       %%v >> infoList.txt
)

for /f "skip=1 tokens=2 delims=[]" %%* in ('ping.exe -n 1 -4 %computername%') Do (set "IP=%%*")
echo IPv4:       %IP% >> infoList.txt

for /f "skip=1 tokens=2 delims=[]" %%* in ('ping.exe -n 1 -6 %computername%') Do (set "IP=%%*")
echo IPv6:       %IP% >> infoList.txt

for /f "tokens=2,* delims=:" %%A in ('ipconfig ^| find "Subnet"') do set subnet=%%A
set subnet=%subnet:~1%
echo SN:         %subnet% >> infoList.txt

for /f "tokens=2 delims=: " %%a in ('echo quit^|nslookup^|find "Address:"') do echo DNS:        %%a >> infoList.txt

echo ------------------------------------------------------ >> infoList.txt
echo ###################################################### >> infoList.txt