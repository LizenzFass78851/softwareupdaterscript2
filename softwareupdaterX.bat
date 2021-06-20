@echo off

pushd "%CD%"
CD /D "%~dp0"

TITLE SW-Updater-Script


:install-firefox
(for %%a IN ("firefox*.exe") DO "%%a" /s && del "%%a" )

:install-readerdc
(for %%a IN (acrordrdc*.msp) DO msiexec.exe /p %%a /q /norestart && del %%a )


:exits
exit