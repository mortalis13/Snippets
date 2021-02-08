rem @echo off

cd %~1
cd..

7z a "%~nx1.zip" "%~nx1"

pause
