@echo off

pushd "%CD%" && CD /D "%~dp0"

TITLE SW-Updater-Script

SET X86-UNINSTALL-REG="HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
SET X64-UNINSTALL-REG="HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"

:install-net-framework-3.5-for-windows-11
(for %%a IN ("DotNet35Setup*.exe") DO echo %%a && "%%a" /install /quiet /norestart && del %%a )

:install-net-windowsdesktop-runtime
(for %%a IN ("windowsdesktop-runtime*.exe") DO echo %%a && "%%a" /install /quiet /norestart && del %%a )

:install-java-8
for %%a IN (jre-8u*-windows-i586.exe) DO (
    echo %%a

    for /f "tokens=8* delims=^\" %%i in ('reg query "%X86-UNINSTALL-REG%" /s /f "Java 8" ^| findstr "HKEY"') do (
        for /f "tokens=2* delims= " %%d in ('reg query "%X86-UNINSTALL-REG%\%%i" /v "DisplayName"') do (
            echo Uninstall: %%e
        )
        msiexec.exe /x%%i /q /norestart
    )

    %%a /s && del %%a
)
for %%a IN (jre-8u*-windows-x64.exe) DO (
    echo %%a

    for /f "tokens=7* delims=^\" %%i in ('reg query "%X64-UNINSTALL-REG%" /s /f "Java 8" ^| findstr "HKEY"') do (
        for /f "tokens=2* delims= " %%d in ('reg query "%X64-UNINSTALL-REG%\%%i" /v "DisplayName"') do (
            echo Uninstall: %%e
        )
        msiexec.exe /x%%i /q /norestart
    )

    %%a /s && del %%a
)

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

:install-keepass-2
(for %%a IN (KeePass-2*-Setup.exe) DO echo %%a && %%a /VERYSILENT /NORESTART /ALLUSERS && del %%a )

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

:install-blender
for %%a IN (blender*-windows-x64.msi) DO (
    echo %%a

    for /f "tokens=7* delims=^\" %%i in ('reg query "%X64-UNINSTALL-REG%" /s /f "Blender" ^| findstr "HKEY"') do (
        for /f "tokens=2* delims= " %%d in ('reg query "%X64-UNINSTALL-REG%\%%i" /v "DisplayName"') do (
            echo Uninstall: %%e
        )
        msiexec.exe /x%%i /q /norestart
    )

    msiexec.exe /i %%a /q /norestart && del %%a
)

:install-teamviewer
(for %%a IN (TeamViewer_Setup*.exe) DO echo %%a && %%a /S && del %%a )

:install-virtualbox
for %%a IN (VirtualBox*.exe) DO (
    echo %%a

    REM to prevent the reboot required by the uninstallation
    %%a --silent
    
    for /f "tokens=8* delims=^\" %%i in ('reg query "%X86-UNINSTALL-REG%" /s /f "Oracle VirtualBox" ^| findstr "HKEY"') do (
        for /f "tokens=2* delims= " %%d in ('reg query "%X86-UNINSTALL-REG%\%%i" /v "DisplayName"') do (
            echo Uninstall: %%e
        )
        msiexec.exe /x%%i /q /norestart
    )
    for /f "tokens=7* delims=^\" %%i in ('reg query "%X64-UNINSTALL-REG%" /s /f "Oracle VirtualBox" ^| findstr "HKEY"') do (
        for /f "tokens=2* delims= " %%d in ('reg query "%X64-UNINSTALL-REG%\%%i" /v "DisplayName"') do (
            echo Uninstall: %%e
        )
        msiexec.exe /x%%i /q /norestart
    )

    %%a --silent && del %%a
)
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

:install-bleachbit
(for %%a IN ("BleachBit-*setup.exe") DO echo %%a && "%%a" /allusers /S && del "%%a" )

:install-notepadpp
(for %%a IN ("npp.*.Installer*.exe") DO echo %%a && "%%a" /S && del "%%a" )

:install-virtualdj
(for %%a IN (install_virtualdj*.msi) DO echo %%a && msiexec.exe /i %%a /q /norestart && del %%a )

:install-reflect
REM ###This method introduces a bug in Macrium Reflect which breaks the creation of shadow copies
REM (for %%a IN (reflect_setup*.exe) DO echo %%a && %%a /q /norestart && del %%a )

:install-hasleo-backup-suite
(for %%a IN (Hasleo_Backup_Suite*_*.exe) DO echo %%a && %%a /SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART && del %%a )

:install-free-download-manager
(for %%a IN (fdm*_*.exe) DO echo %%a && %%a /SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART && del %%a )

:install-hwinfo
(for %%a IN (hwi*.exe) DO echo %%a && %%a /SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART && del %%a )

:install-greenshot
(for %%a IN (Greenshot-INSTALLER-*-RELEASE.exe) DO echo %%a && %%a /SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /ALLUSERS && del %%a )

:install-gimp
(for %%a IN (gimp-*-setup*.exe) DO echo %%a && %%a /SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /ALLUSERS && del %%a )

:install-inkscape
(for %%a IN (inkscape-*.exe) DO echo %%a && %%a /S && del %%a )

:install-google-earth
(for %%a IN (googleearthprowin-*.exe) DO echo %%a && %%a OMAHA=1 && del %%a )

:install-chrome
(for %%a IN (Chrome*Setup*.exe) DO echo %%a && %%a /silent /install && del %%a )

:install-msedge-new
(for %%a IN (MicrosoftEdgeEnterprise*.msi) DO echo %%a && msiexec.exe /i %%a /q /norestart && del %%a )

:install-ashampoo-burning-studio
for %%a IN (ashampoo_burning_studio_*.exe) DO (
    echo %%a
 
    for /f "tokens=8* delims=^\" %%i in ('reg query "%X86-UNINSTALL-REG%" /s /f "Ashampoo Burning Studio" ^| findstr "HKEY"') do (
        for /f "tokens=2* delims= " %%d in ('reg query "%X86-UNINSTALL-REG%\%%i" /v "DisplayName"') do (
            echo Uninstall: %%e
        )
        for /f "tokens=2* delims= " %%d in ('reg query "%X86-UNINSTALL-REG%\%%i" /v "QuietUninstallString"') do (
            %%e
        )
    )
    for /f "tokens=7* delims=^\" %%i in ('reg query "%X64-UNINSTALL-REG%" /s /f "Ashampoo Burning Studio" ^| findstr "HKEY"') do (
        for /f "tokens=2* delims= " %%d in ('reg query "%X64-UNINSTALL-REG%\%%i" /v "DisplayName"') do (
            echo Uninstall: %%e
        )
        for /f "tokens=2* delims= " %%d in ('reg query "%X64-UNINSTALL-REG%\%%i" /v "QuietUninstallString"') do (
            %%e
        )
    )

    %%a /SP- /VERYSILENT /SUPPRESSMSGBOXES /NORESTART && del %%a || echo Ashampoo Burning Studio may require a product key, or the setup may report errors during execution. Run the setup manually and follow the instructions. && timeout 10
    IF EXIST "%PUBLIC%\Desktop\Ashampoo Deals.url" del "%PUBLIC%\Desktop\Ashampoo Deals.url"
)

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
