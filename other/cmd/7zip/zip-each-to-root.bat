rem 7-zip each folder in a separate archive
rem first put the file to a folder with other folders

cd %~dp0
for /d %%a in (*) do 7z a "%%a.zip" ".\%%a\*"
pause
