@echo off

rem ------------
rem Shows content for DB tables
rem pass table names as script arguments separated with spaces
rem pass 'tabs' argument to show table names
rem It needs 'adbd Insecure' Android app to be installed on the device
rem with 'Enable insecure adbd' option enabled (requires root to pull database)
rem ------------


set db_name=myapp.db
set default_table=bar

call adb pull data/data/org.home.myapp/databases/%db_name%


if "%1" == "tabs" (
  call :show_tabs
  goto:eof
)

if [%1] == [] (
  goto :print_default
  goto:eof
)

set args=%1
shift
:args_start
  if [%1] == [] goto args_done
  set args=%args% %1
  shift
goto args_start
:args_done

for %%i in (%args%) do (
  set table=%%i
  call :print_data
)
goto:eof


rem ------ Methods ------

:print_default
  set table=%default_table%
  call :print_data
goto:eof


:print_data
  echo.
  echo == [%table%] ==
  
  set order=
  if [%table%] == [tab1] set order=order by col1
  if [%table%] == [tab2] set order=order by col1,col2
  
  set sql=select * from %table% %order%;
  echo "%sql%"
  echo.
  
  sqlite3 %db_name% ".mode column" ".header on" "%sql%"
goto:eof


:show_tabs
  echo.
  echo == Tables List ==
  echo.
  sqlite3 %db_name% "select name from sqlite_master where type='table' order by name;"
goto:eof
