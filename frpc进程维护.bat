@echo off

set sum=0
set Program="frpc.exe"
:strat
set /a sum+=1
tasklist -v | findstr %Program% > NUL
if ErrorLevel 1 (
  echo %date% %time%  "警告：进程丢失！"
  echo %date% %time%  "frpc进程丢失，重启frp服务" >> C:\frp\frp_log\log.txt
  start /d "C:\frp\frp_0.36.2_windows_386" frpcqd.bat
)
if ErrorLevel 0 (
  echo %date% %time%  "进程存在"
)
rem 超时 t：600秒
timeout /t 600 /nobreak > nul
rem 计数器 LSS：<10次
if %sum% LSS 10 goto start
