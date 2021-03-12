title Azure-Auto-Region

echo Download all files...
curl --silent -O https://raw.githubusercontent.com/TheDarkMythos/Ngrok-Exe/master/ngrok.exe 
curl --silent -O https://raw.githubusercontent.com/DangDev/cirrus-win/main/explorer.exe

echo Copy NGROK to System32...
copy ngrok.exe C:\Windows\System32 >nul
copy explorer.exe C:\Windows >nul
start C:\Windows\explorer.exe

echo CONNECT NGROK AUTH TOKEN...
start NGROK.bat >nul


echo Check Region for NGROK...
start ngrok tcp --region ap 3389

echo Setup Profile...
tzutil /s "SE Asia Standard Time" >nul
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v ColorPrevalence /t REG_DWORD /d 1 /f >nul
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 1 /f >nul
taskkill /f /im sqlservr.exe >nul
taskkill /f /im Batch.exe >nul
taskkill /f /im w3wp.exe >nul
taskkill /f /im explorer.exe >nul
start explorer.exe >nul

echo Finished!
@echo off
net config server /srvcomment:"Windows Cirrus VM" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
net user administrator Dangvip2k5pro /add >nul
net user ContainerAdministrator Dangvip2k5pro /add >nul
net localgroup administrators administrator /add >nul
net localgroup administrators ContainerAdministrator /add >nul
echo To change another VM region, Create New organization (Your current VM location:  %LO% )
echo Region Available: West Europe, Central US, East Asia, Brazil South, Canada Central, Autralia East, UK South, South India
echo All done! Connect your VM using RDP. When RDP expired and VM shutdown, Rerun failed jobs to get a new RDP.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Can't get NGROK tunnel. Maybe your previous VM still running: https://dashboard.ngrok.com/status/tunnels " && exit 
echo User: Administrator
echo Pass: Thuonghai001
curl -O https://gitlab.com/haithuongpro2711/haivps/-/raw/master/Files/DisablePasswordComplexity.ps1 > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\Fast Config VPS.exe" https://gitlab.com/haithuongpro2711/haivps/-/raw/master/Files/FastConfigVPS_v5.1.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\EVKey Vietnamese Keyboard.exe" https://gitlab.com/haithuongpro2711/haivps/-/raw/master/Files/EVKey64.exe > out.txt 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './DisablePasswordComplexity.ps1'" > out.txt 2>&1
diskperf -Y >nul
sc start audiosrv >nul
sc config Audiosrv start= auto >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant ContainerAdministrator:F >nul
ICACLS C:\Windows\Temp /grant ContainerAdministrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
ping -n 99999999999999999999999999999999 10.10.10.10 >nul
