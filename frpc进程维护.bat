@echo off

set Program="frpc.exe"
tasklist -v | findstr %Program% > NUL
if ErrorLevel 1 (
  echo %date% %time%  "frpc进程丢失，重启frp服务" >> C:\frp\frp_log\log.txt
  start /d "C:\frp\frp_0.36.2_windows_386" frpcqd.bat
  ) else (
  echo "frp服务正在运行"
)
