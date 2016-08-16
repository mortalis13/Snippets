@echo off
rem @echo off
rem %~1
@echo on

cd %~1
git add .
git commit -m "edit"
git push

pause