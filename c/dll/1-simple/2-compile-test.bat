cd /d %~dp0
gcc -o addtest_basic.exe -s addtest_basic.c -L . -l add_basic
pause
