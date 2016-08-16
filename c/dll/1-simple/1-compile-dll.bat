cd /d %~dp0
gcc -o add_basic.dll -s -shared add_basic.c -Wl,--subsystem,windows
pause
