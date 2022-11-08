@echo off

pushd "%CD%"
CD /D "%~dp0"

TITLE SW-Updater-Script


:instal-java-8
(for %%a IN (jre-8u*-windows-i586.exe) DO echo %%a && wmic product where "name like 'Java 8%%'" call uninstall && %%a /s && del %%a )
(for %%a IN (jre-8u*-windows-x64.exe) DO echo %%a && %%a /s && del %%a )

:install-firefox
(for %%a IN ("firefox*.exe") DO echo %%a && "%%a" /s && del "%%a" )

:install-thunderbird
(for %%a IN ("thunderbird*.exe") DO echo %%a && "%%a" /s && del "%%a" )

:install-readerdc-update-pack
(for %%a IN (acrordrdc*.msp) DO echo %%a && msiexec.exe /p %%a /q /norestart && del %%a )

:install-readerdc-exe-setup
(for %%a IN (AcroRdrDC*.exe) DO echo %%a && %%a /sAll /rs /msi EULA_ACCEPT=YES && del %%a )

:install-libreoffice
(for %%a IN (LibreOffice*.msi) DO echo %%a && msiexec.exe /i %%a /q /norestart && del %%a )

:install-vlc
(for %%a IN (vlc*.exe) DO echo %%a && %%a /S && del %%a )

:install-virtualbox
(for %%a IN (VirtualBox*.exe) DO echo %%a && %%a --silent && del %%a )
REM not silent step and file after not deleted
(for %%a IN (Oracle_VM_VirtualBox_Extension_Pack*.vbox-extpack) DO echo %%a && explorer %%a )

:install-xmediarecode
(for %%a IN (XMediaRecode*.exe) DO echo %%a && %%a /VERYSILENT /NORESTART && del %%a )

:install-furmark
(for %%a IN (FurMark*.exe) DO echo %%a && %%a /VERYSILENT /NORESTART && del %%a )

:install-ccleaner
(for %%a IN ("ccsetup*.exe") DO echo %%a && "%%a" /S && del "%%a" )

:install-recuva
(for %%a IN ("rcsetup*.exe") DO echo %%a && "%%a" /S && del "%%a" )

:install-virtualdj
(for %%a IN (install_virtualdj*.msi) DO echo %%a && msiexec.exe /i %%a /q /norestart && del %%a )

:install-reflect
REM This method introduces a bug in Macrium Reflect which breaks the creation of shadow copies
REM ECHO Macrium Reflect
REM (for %%a IN (reflect_setup*.exe) DO echo %%a && %%a /q /norestart && del %%a )

:install-free-download-manager
(for %%a IN (fdm*_*.exe) DO echo %%a && %%a /SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART && del %%a )

:install-google-earth
(for %%a IN (googleearthprowin-*.exe) DO echo %%a && %%a OMAHA=1 && del %%a )

:install-chrome
(for %%a IN (Chrome*Setup*.exe) DO echo %%a && %%a /silent /install && del %%a )

:install-msedge-new
(for %%a IN (MicrosoftEdgeEnterprise*.msi) DO echo %%a && msiexec.exe /i %%a /q /norestart && del %%a )

:install-dumo
(for %%a IN (dumo*.exe) DO echo %%a && %%a /VERYSILENT /NORESTART && del %%a )
IF EXIST "%USERPROFILE%\Desktop\SUMo Home Page.URL" del "%USERPROFILE%\Desktop\SUMo Home Page.URL"

:install-sumo
(for %%a IN (sumo*.exe) DO echo %%a && %%a /VERYSILENT /NORESTART && del %%a )

:exits
exit
