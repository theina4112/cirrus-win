@echo off
curl --silent -O https://raw.githubusercontent.com/kingofnetflix/cirrus-win/main/ngrok.exe
ngrok.exe config add-authtoken 1nUH5O5RlHDFfWb1jlBjQmulJD2_37nVZHH6NKzSq9Fd2KGQH
timeout 5
start ngrok.exe tcp --region us 3389
tzutil /s "SE Asia Standard Time" >nul
sc start audiosrv >nul
net config server /srvcomment:"rdpempire" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
start powershell Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
start powershell Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
net user KingOfNetflix rdpempire1! /add
timeout 2
net localgroup administrators KingOfNetflix /add
curl -o "C:\Users\KingOfNetflix\Desktop\Fast Config VPS.exe" https://raw.githubusercontent.com/kingofnetflix/dangdev/main/software/FastConfigVPS_v2.3.exe > out.txt 2>&1
curl -o "C:\Users\KingOfNetflix\Desktop\EVKey Vietnamese Keyboard.exe" https://raw.githubusercontent.com/kingofnetflix/dangdev/main/software/EVKey64.exe > out.txt 2>&1
curl -o "C:\Users\KingOfNetflix\Desktop\Enable Session notification.vbs" https://raw.githubusercontent.com/kingofnetflix/dangdev/main/Session.vbs > out.txt 2>&1
curl -o "C:\Users\KingOfNetflix\Desktop\swd.bat" https://raw.githubusercontent.com/kingofnetflix/dangdev/main/swd.bat > out.txt 2>&1
curl -o "C:\Users\KingOfNetflix\Desktop\minecraft_java_ngrok.bat" https://raw.githubusercontent.com/kingofnetflix/dangdev/main/minecraft_java_ngrok.bat > out.txt 2>&1
curl -o "C:\Users\KingOfNetflix\Desktop\minecraft_java_playit.bat" https://raw.githubusercontent.com/kingofnetflix/dangdev/main/minecraft_java_playit.bat > out.txt 2>&1
curl -o "C:\Users\KingOfNetflix\Desktop\auto_bedrock.bat" https://raw.githubusercontent.com/kingofnetflix/dangdev/main/auto_bedrock.bat > out.txt 2>&1
diskperf -Y >nul
sc config Audiosrv start= auto >nul
ICACLS C:\Windows\Temp /grant KingOfNetflix:F >nul
ICACLS C:\Windows\installer /grant KingOfNetflix:F >nul
ICACLS C:\Windows\Temp /grant KingOfNetflix:F >nul
ICACLS C:\Windows\installer /grant KingOfNetflix:F >nul
curl --silent -O https://raw.githubusercontent.com/kingofnetflix/cirrus-win/main/crd.ps1
start powershell crd.ps1
echo Completed! Please check RDP address in ngrok endpoints. https://dashboard.ngrok.com/cloud-edge/endpoints/
ping -n 99999999999999999999999999999999 10.10.10.10 >nul
