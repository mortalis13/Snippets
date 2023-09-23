@echo off
if not exist %cd%\venv (
    echo Creating venv
    python -m venv %cd%\venv
)
%cd%\venv\Scripts\activate
