cd /d %~dp0
call "c:\Archivos de programa\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"
cl /LD /I "c:\Archivos de programa\Java\jdk1.7.0_79\include" /I "c:\Archivos de programa\Java\jdk1.7.0_79\include\win32" NativeDemo.c
pause
