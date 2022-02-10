
@echo off

rem git help -a
rem find credential-*
rem put * after the 'credential.helper'

@echo on

git config --global credential.helper store

pause
