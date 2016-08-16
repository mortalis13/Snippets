cd /d %~dp0
g++ -o example_exe.exe example_exe.cpp -L./lib -lexample_dll
pause
