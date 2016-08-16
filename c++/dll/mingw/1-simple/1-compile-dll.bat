cd /d %~dp0
g++ -shared -o example_dll.dll example_dll.cpp -DBUILDING_EXAMPLE_DLL -Wl,--out-implib,libexample_dll.a
pause
