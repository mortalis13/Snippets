@echo off

rem ###############################
rem usage: decompile-apk my.apk
rem ###############################

rem echo cd %cd%
rem echo dp0 %~dp0%
rem echo n1 %~n1%

path=c:\Program Files\7-Zip;%path%

set decompile_root=e:\tools\decompile-apk
set output_dir=%cd%\%~n1.src
set temp_dir=%cd%\temp
set temp_dir_proj=%temp_dir%\%~n1
set classes_jar=classes-dex2jar.jar
set classes_jar_src=classes-dex2jar.src.jar

mkdir temp

echo %temp_dir_proj%\%classes_jar%

7z x %cd%\%1 -o%temp_dir%\*
call %decompile_root%\dex2jar-2.0\d2j-dex2jar.bat -o %temp_dir_proj%\%classes_jar% %temp_dir_proj%\classes.dex
call %decompile_root%\jd-cli-0.9.1\jd-cli -oz %temp_dir_proj%\%classes_jar_src% %temp_dir_proj%\%classes_jar%
call %decompile_root%\apktool\apktool.bat d -o %output_dir% %1
7z x %temp_dir_proj%\%classes_jar_src% -o%output_dir%\src
