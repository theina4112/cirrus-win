@echo off
curl --silent -O https://raw.githubusercontent.com/freddyzuncover/cirrus-win/main/ngrok.exe
ngrok.exe config add-authtoken 1nUH5O5RlHDFfWb1jlBjQmulJD2_37nVZHH6NKzSq9Fd2KGQH
timeout 5
ngrok.exe tcp --region us 3389
tzutil /s "SE Asia Standard Time" >nul
sc start audiosrv >nul
net config server /srvcomment:"rdpempire" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
net user KingOfNetflix Thounghai001 /add >nul
net localgroup administrators KingOfNetflix /add >nul
curl -o "C:\Users\Public\Desktop\Fast Config VPS.exe" https://raw.githubusercontent.com/freddyzuncover/dangdev/main/software/FastConfigVPS_v2.3.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\EVKey Vietnamese Keyboard.exe" https://raw.githubusercontent.com/freddyzuncover/dangdev/main/software/EVKey64.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\Enable Session notification.vbs" https://raw.githubusercontent.com/freddyzuncover/dangdev/main/Session.vbs > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\swd.bat" https://raw.githubusercontent.com/freddyzuncover/dangdev/main/swd.bat > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\minecraft_java_ngrok.bat" https://raw.githubusercontent.com/freddyzuncover/dangdev/main/minecraft_java_ngrok.bat > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\minecraft_java_playit.bat" https://raw.githubusercontent.com/freddyzuncover/dangdev/main/minecraft_java_playit.bat > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\auto_bedrock.bat" https://raw.githubusercontent.com/freddyzuncover/dangdev/main/auto_bedrock.bat > out.txt 2>&1
diskperf -Y >nul
sc config Audiosrv start= auto >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant VssAdministrator:F >nul
ICACLS C:\Windows\Temp /grant VssAdministrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
echo Completed!
ping -n 99999999999999999999999999999999 10.10.10.10 >nul
