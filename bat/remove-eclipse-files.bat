@echo off

rem set project_path=C:\app
set project_path=%1

cd %project_path%

del /s /q /f "%project_path%\.project"
del /s /q /f "%project_path%\.classpath"
rem del /s /q /f "%project_path%\.settings"
rem rmdir "%project_path%\.settings"

rem for /f %%a in ('dir /a:d/b/s *.settings') do echo %%a
for /f %%a in ('dir /a:d/b/s *.settings') do (
	del /s /q /f "%%a"
	rmdir "%%a"
)
