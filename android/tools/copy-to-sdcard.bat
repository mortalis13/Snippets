cd %~dp0
for %%a in (*) do adb push "%%a" /mnt/sdcard/4-temp
pause