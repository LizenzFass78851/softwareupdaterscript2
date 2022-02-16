@echo off

pushd "%CD%"
CD /D "%~dp0"

TITLE SW-Updater-Script


:install-firefox
ECHO Firefox
(for %%a IN ("firefox*.exe") DO "%%a" /s && del "%%a" )

:install-thunderbird
ECHO Thunderbird
(for %%a IN ("thunderbird*.exe") DO "%%a" /s && del "%%a" )

:install-readerdc-update-pack
ECHO Adobe Reader DC (msp)
(for %%a IN (acrordrdc*.msp) DO msiexec.exe /p %%a /q /norestart && del %%a )

:install-readerdc-exe-setup
ECHO Adobe Reader DC (exe)
(for %%a IN (AcroRdrDC*.exe) DO %%a /sAll /rs /msi EULA_ACCEPT=YES && del %%a )

:install-libreoffice
ECHO LibreOffice
(for %%a IN (LibreOffice*.msi) DO msiexec.exe /i %%a /q /norestart && del %%a )

:install-vlc
ECHO VLC
(for %%a IN (vlc*.exe) DO %%a /S && del %%a )

:install-virtualbox
ECHO VirtualBox
(for %%a IN (VirtualBox*.exe) DO %%a --silent && del %%a )
REM not silent step and file after not deleted
(for %%a IN (Oracle_VM_VirtualBox_Extension_Pack*.vbox-extpack) DO explorer %%a )

:install-xmediarecode
ECHO Xmedia Recode
(for %%a IN (XMediaRecode*.exe) DO %%a /VERYSILENT /NORESTART && del %%a )

:install-furmark
ECHO FurMark
(for %%a IN (FurMark*.exe) DO %%a /VERYSILENT /NORESTART && del %%a )

:install-ccleaner
ECHO ccleaner
(for %%a IN ("ccsetup*.exe") DO "%%a" /S && del "%%a" )

:install-virtualdj
ECHO Virtualdj
(for %%a IN (install_virtualdj*.msi) DO msiexec.exe /i %%a /q /norestart && del %%a )

:install-reflect
REM This method introduces a bug in Macrium Reflect which breaks the creation of shadow copies
REM ECHO Macrium Reflect
REM (for %%a IN (reflect_setup*.exe) DO %%a /q /norestart && del %%a )

:install-msedge-new
ECHO Microsoft Edge
(for %%a IN (MicrosoftEdgeEnterprise*.msi) DO msiexec.exe /i %%a /q /norestart && del %%a )

:install-dumo
ECHO DUMO
(for %%a IN (dumo*.exe) DO %%a /VERYSILENT /NORESTART && del %%a )

:install-sumo
ECHO SUMO
(for %%a IN (sumo*.exe) DO %%a /VERYSILENT /NORESTART && del %%a )

:exits
exit
