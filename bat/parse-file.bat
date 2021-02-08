@echo off

for /F "eol=;" %%i in (myfile.txt) do (
  @echo line-%%i
)
