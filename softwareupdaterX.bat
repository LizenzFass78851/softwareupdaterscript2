@echo off

pushd "%CD%" && CD /D "%~dp0"

TITLE SW-Updater-Script


:install-firefox
(for %%a IN ("firefox*.exe") DO echo %%a && "%%a" /s && del "%%a" )

:install-readerdc-update-pack
(for %%a IN (acrordrdc*.msp) DO echo %%a && msiexec.exe /p %%a /q /norestart && del %%a )

:install-readerdc-exe-setup
(for %%a IN (AcroRdrDC*.exe) DO echo %%a && %%a /sAll /rs /msi EULA_ACCEPT=YES && del %%a )

:install-keepass-2
(for %%a IN (KeePass-2*-Setup.exe) DO echo %%a && %%a /VERYSILENT /NORESTART /ALLUSERS && del %%a )

REM :install-pdf24-creator
REM (for %%a IN (pdf24-creator*.exe) DO echo %%a && %%a /VERYSILENT /NORESTART && del %%a )

:install-notepadpp
(for %%a IN ("npp.*.Installer*.exe") DO echo %%a && "%%a" /S && del "%%a" )

:install-greenshot
(for %%a IN (Greenshot-INSTALLER-*-RELEASE.exe) DO echo %%a && %%a /SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /ALLUSERS && del %%a )

:install-inkscape
(for %%a IN (inkscape-*.exe) DO echo %%a && %%a /S && del %%a )

:install-office-msi-updates
(for %%a IN (*x-none.msp) DO echo %%a && msiexec.exe /p %%a /q /norestart && del %%a )


:exits
exit
