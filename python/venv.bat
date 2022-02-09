@echo off
if not exist %cd%\venv (
    echo Creating venv
    py -m venv %cd%\venv
)
%cd%\venv\Scripts\activate
