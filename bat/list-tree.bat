@echo off

rem set project_path=g:\Programming\books\android
set project_path=g:\Programming\books\cms
rem cd %project_path%

for /f "tokens=*" %%d in ('dir %project_path% /b') do (
  echo %%d
)


rem for /f "tokens=*" %%d in ('dir %project_path% /b') do (
rem   echo %%d
rem   rem echo %project_path%\%%d
rem   rem for /r %%i in (%project_path%\%%d\*.pdf) do echo %%~nxi
rem   rem for /r %project_path% %%i in (%%d\*.pdf) do echo     %%~nxi
rem   for %%i in (%project_path%\%%d\*.pdf) do echo     %%~nxi
rem )