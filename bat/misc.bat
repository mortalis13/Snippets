@echo off

rem -- replace backslashes by forward slashes in variable
set DIR_PATH=d:\Docs
set DIR_PATH=%DIR_PATH:\=/%
echo %DIR_PATH%
