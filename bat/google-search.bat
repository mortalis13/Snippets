@echo off
set term=%1
set out_file=google.html

curl -sA "Chrome" -o %out_file% "https://www.google.com/search?q=%term%"
if exist %out_file% (
  call %out_file%
)
