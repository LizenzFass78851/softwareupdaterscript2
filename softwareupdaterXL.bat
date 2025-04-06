@echo off

pushd "%CD%" && CD /D "%~dp0"

TITLE SW-Updater-Script


:install-java-8
(for %%a IN (jre-8u*-windows-i586.exe) DO echo %%a && wmic product where "name like 'Java 8%%'" call uninstall && %%a /s && del %%a )
(for %%a IN (jre-8u*-windows-x64.exe) DO echo %%a && %%a /s && del %%a )

:install-7zip
(for %%a IN (7z*.exe) DO echo %%a && %%a /S && del %%a )

:install-anydesk
REM ###not possible because anydesk is not made for this kind of silent install
REM set ANYDESKPROG=C:\Program Files
REM if %PROCESSOR_ARCHITECTURE%==AMD64 set ANYDESKPROG=C:\Program Files (x86)
REM (for %%a IN (AnyDesk.exe) DO echo %%a && %%a --install "%ANYDESKPROG%\AnyDesk" --start-with-win --create-shortcuts --create-desktop-icon --silent && timeout 2 && del %%a )

:install-firefox
(for %%a IN ("firefox*.exe") DO echo %%a && "%%a" /s && del "%%a" )

:install-thunderbird
(for %%a IN ("thunderbird*.exe") DO echo %%a && "%%a" /s && del "%%a" )

:install-winscp
(for %%a IN (WinSCP*-Setup.exe) DO echo %%a && %%a /VERYSILENT /NORESTART /ALLUSERS && del %%a )

:install-putty
(for %%a IN (putty*-installer.msi) DO echo %%a && msiexec.exe /i %%a /q /norestart && del %%a )

:install-readerdc-update-pack
(for %%a IN (acrordrdc*.msp) DO echo %%a && msiexec.exe /p %%a /q /norestart && del %%a )

:install-readerdc-exe-setup
(for %%a IN (AcroRdrDC*.exe) DO echo %%a && %%a /sAll /rs /msi EULA_ACCEPT=YES && del %%a )

:install-libreoffice
(for %%a IN (LibreOffice*.msi) DO echo %%a && msiexec.exe /i %%a /q /norestart && del %%a )

:install-onlyoffice
(for %%a IN (DesktopEditors_x*.exe) DO echo %%a && %%a /VERYSILENT /NORESTART && del %%a )

:install-vlc
(for %%a IN (vlc*.exe) DO echo %%a && %%a /S && del %%a )

:install-musicbrainz-picard
(for %%a IN (picard-setup*.exe) DO echo %%a && %%a /S && del %%a )

:install-faststone-image-viewer
(for %%a IN (FSViewerSetup*.exe) DO echo %%a && %%a /S && del %%a )

:install-teamviewer
(for %%a IN (TeamViewer_Setup*.exe) DO echo %%a && %%a /S && del %%a )

:install-virtualbox
(for %%a IN (VirtualBox*.exe) DO echo %%a && %%a --silent && del %%a )
REM not silent step and file after not deleted
(for %%a IN (Oracle*_VirtualBox_Extension_Pack*.vbox-extpack) DO echo %%a && explorer %%a )

:install-pdf24-creator
(for %%a IN (pdf24-creator*.exe) DO echo %%a && %%a /VERYSILENT /NORESTART && del %%a )

:install-xmediarecode
(for %%a IN (XMediaRecode*.exe) DO echo %%a && %%a /VERYSILENT /NORESTART && del %%a )

:install-furmark
(for %%a IN (FurMark*.exe) DO echo %%a && %%a /VERYSILENT /NORESTART && del %%a )

:install-ccleaner
(for %%a IN ("ccsetup*.exe") DO echo %%a && "%%a" /S && del "%%a" )

:install-recuva
(for %%a IN ("rcsetup*.exe") DO echo %%a && "%%a" /S && del "%%a" )

:install-notepadpp
(for %%a IN ("npp.*.Installer*.exe") DO echo %%a && "%%a" /S && del "%%a" )

:install-virtualdj
(for %%a IN (install_virtualdj*.msi) DO echo %%a && msiexec.exe /i %%a /q /norestart && del %%a )

:install-reflect
REM ###This method introduces a bug in Macrium Reflect which breaks the creation of shadow copies
REM (for %%a IN (reflect_setup*.exe) DO echo %%a && %%a /q /norestart && del %%a )

:install-free-download-manager
(for %%a IN (fdm*_*.exe) DO echo %%a && %%a /SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART && del %%a )

:install-hwinfo
(for %%a IN (hwi*.exe) DO echo %%a && %%a /SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART && del %%a )

:install-google-earth
(for %%a IN (googleearthprowin-*.exe) DO echo %%a && %%a OMAHA=1 && del %%a )

:install-chrome
(for %%a IN (Chrome*Setup*.exe) DO echo %%a && %%a /silent /install && del %%a )

:install-msedge-new
(for %%a IN (MicrosoftEdgeEnterprise*.msi) DO echo %%a && msiexec.exe /i %%a /q /norestart && del %%a )

:install-ashampoo-burning-studio
(for %%a IN (ashampoo_burning_studio_*.exe) DO echo %%a && %%a /SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART && del %%a )
IF EXIST "%PUBLIC%\Desktop\Ashampoo Deals.url" del "%PUBLIC%\Desktop\Ashampoo Deals.url"

:install-cdburnerxp
(for %%a IN (cdbxp_setup*.exe) DO echo %%a && %%a /VERYSILENT /NORESTART && del %%a )

:install-dumo
(for %%a IN (dumo*.exe) DO echo %%a && %%a /VERYSILENT /NORESTART && del %%a )
IF EXIST "%USERPROFILE%\Desktop\SUMo Home Page.URL" del "%USERPROFILE%\Desktop\SUMo Home Page.URL"

:install-sumo
(for %%a IN (sumo*.exe) DO echo %%a && %%a /VERYSILENT /NORESTART && del %%a )

:install-wingetui
(for %%a IN (WingetUI.Installer*.exe) DO echo %%a && %%a /SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /ALLUSERS && del %%a )

:install-ucheck
(for %%a IN (UCheck_setup*.exe) DO echo %%a && %%a /SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART && del %%a )

:install-office-msi-updates
(for %%a IN (*x-none.msp) DO echo %%a && msiexec.exe /p %%a /q /norestart && del %%a )

:exits
exit
