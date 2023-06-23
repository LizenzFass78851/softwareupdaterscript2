@echo off

pushd "%CD%"
CD /D "%~dp0"

TITLE SW-Updater-Script


:install-firefox
(for %%a IN ("firefox*.exe") DO echo %%a && "%%a" /s && del "%%a" )

:install-readerdc-update-pack
(for %%a IN (acrordrdc*.msp) DO echo %%a && msiexec.exe /p %%a /q /norestart && del %%a )


:exits
exit
