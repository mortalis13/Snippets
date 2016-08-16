cd /d %~dp0
gcc -o add.dll -s -shared add.c -D ADD_EXPORTS -Wl,--subsystem,windows
pause
