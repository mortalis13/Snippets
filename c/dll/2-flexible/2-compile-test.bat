cd /d %~dp0
gcc -o addtest.exe -s addtest.c -L . -l add
pause
