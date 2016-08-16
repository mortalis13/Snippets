cd /d %~dp0
echo off
rem set path to the vcvarsall.bat in the VS fodler
echo on
call "c:\Archivos de programa\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"
cl MyExecRefsDll.cpp /EHsc /link MathFuncsDll.lib
pause
