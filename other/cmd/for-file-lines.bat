echo off
cd %~dp0
for /F %%a in (list.txt) do echo %%a
pause