cd /d %~dp0
gcc -o add_var.dll -s -shared add_var.c -D ADD_EXPORTS -Wl,--subsystem,windows
pause
