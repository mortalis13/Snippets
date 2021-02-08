echo off
cd %~dp0
for /d %%a in (*) do echo %%a
pause