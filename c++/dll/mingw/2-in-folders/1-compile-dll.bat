cd /d %~dp0
g++ -shared -o bin/example_dll.dll example_dll.cpp -DBUILDING_EXAMPLE_DLL -Wl,--out-implib,lib/libexample_dll.a
pause
