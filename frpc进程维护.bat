@echo off

set Program="frpc.exe"  
tasklist -v | findstr %Program% > NUL  
if ErrorLevel 1 (  
  echo %date% %time%  "frpc���̶�ʧ������frp����" >> C:\frp\frp_log\log.txt  
  start /d "C:\frp\frp_0.36.2_windows_386" frpcqd.bat
)
if ErrorLevel 0(
  echo "frp������������"
)  