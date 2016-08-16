cd /d %~dp0
gcc -o bin/add.dll -s -shared add.c -D ADD_EXPORTS -Wl,--subsystem,windows,--out-implib,lib/libadd.a
pause
