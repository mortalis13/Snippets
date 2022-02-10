@echo off

for /d %%a in (c:\GitHub\*) do
(
    if exist %%a\.git
    (
        echo %%a
        git config -f %%a\.git\config user.name "name"
        git config -f %%a\.git\config user.email "mail@mail.com"
    )
)
