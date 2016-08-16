rem @echo off

cd %~p1
7z x "%~nx1" -o"%~p1%~n1" -r

rem pause
