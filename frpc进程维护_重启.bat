@echo off

set Program="frpc.exe"
tasklist | findstr %Program% > NUL
if ErrorLevel 1 (
  echo %date% %time%  "frpc进程不存在，启动frp服务" >> C:\frp\frp_log.txt
  start /d "C:\frp\frp_0.36.2_windows_386" frpcqd.bat
  ) else (
  echo %date% %time%  "frpc进程存在，重启frp服务" >> C:\frp\frp_log.txt
  taskkill /f /im frpc.exe
  start /d "C:\frp\frp_0.36.2_windows_386" frpcqd.bat
)
