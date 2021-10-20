title Azure-Auto-Region

echo Download all files...
curl --silent -O https://raw.githubusercontent.com/TheDarkMythos/Ngrok-Exe/master/ngrok.exe

echo Copy NGROK to System32...
copy ngrok.exe C:\Windows\System32 >nul

echo CONNECT NGROK AUTH TOKEN...
start NGROK.bat >nul


echo Check Region for NGROK...
curl -s ifconfig.me >ip.txt
set /p IP=<ip.txt
curl -s "http://api.whoapi.com/?apikey=bde247b641898256b1aaefcd1df201d9&r=geo&domain=&ip=%IP%" >full.txt
type full.txt | jq -r .geo_cc >region.txt
type full.txt | jq -r .geo_country >location.txt
start ngrok tcp --region au 3389

echo Setup Profile...
tzutil /s "SE Asia Standard Time" >nul
sc start audiosrv >nul

echo Finished!
@echo off
net config server /srvcomment:"DiemQuynh" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
net user administrator DiemQuynh1 /add >nul
net localgroup administrators administrator /add >nul
net user VssAdministrator DiemQuynh1 >nul
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Can't get NGROK tunnel. Maybe your previous VM still running: https://dashboard.ngrok.com/status/tunnels " && exit 
echo User: Administrator
echo Pass: [Secret]
curl -o "C:\Users\Public\Desktop\Fast Config VPS.exe" https://raw.githubusercontent.com/DangDev/dangdev/main/software/FastConfigVPS_v2.3.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\EVKey Vietnamese Keyboard.exe" https://raw.githubusercontent.com/DangDev/dangdev/main/software/EVKey64.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\Enable Session notification.vbs" https://raw.githubusercontent.com/DangDev/dangdev/main/Session.vbs > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\swd.bat" https://raw.githubusercontent.com/DangDev/dangdev/main/swd.bat > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\minecraft_java_ngrok.bat" https://raw.githubusercontent.com/DangDev/dangdev/main/minecraft_java_ngrok.bat > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\minecraft_java_playit.bat" https://raw.githubusercontent.com/DangDev/dangdev/main/minecraft_java_playit.bat > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\auto_bedrock.bat" https://raw.githubusercontent.com/DangDev/dangdev/main/auto_bedrock.bat > out.txt 2>&1
diskperf -Y >nul

sc config Audiosrv start= auto >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant VssAdministrator:F >nul
ICACLS C:\Windows\Temp /grant VssAdministrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul


ping -n 99999999999999999999999999999999 10.10.10.10 >nul
