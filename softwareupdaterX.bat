@echo off

pushd "%CD%" && CD /D "%~dp0"

TITLE SW-Updater-Script


:install-firefox
(for %%a IN ("firefox*.exe") DO echo %%a && "%%a" /s && del "%%a" )

:install-readerdc-update-pack
(for %%a IN (acrordrdc*.msp) DO echo %%a && msiexec.exe /p %%a /q /norestart && del %%a )

:install-readerdc-exe-setup
(for %%a IN (AcroRdrDC*.exe) DO echo %%a && %%a /sAll /rs /msi EULA_ACCEPT=YES && del %%a )

:install-office-msi-updates
(for %%a IN (*x-none.msp) DO echo %%a && msiexec.exe /p %%a /q /norestart && del %%a )


:exits
exit
