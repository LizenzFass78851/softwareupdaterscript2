#!/bin/bash
set -e # Beende das Skript bei einem Fehler

# Voreinstellungen
#SUCHVERZEICHNIS=
PATCHTHEFILE=README.md

LINKS=/tmp/$PATCHTHEFILE.txt

# Hole die Links
if [ -e "$LINKS" ]; then
  rm "$LINKS"
fi

cat softwareupdaterXL.bat \
  | grep ":install" \
  | sed 's#^:install-##g' \
  | tr '-' ' ' \
  | sed -r 's/(A-Z)/\L\1/g ; s/(\<[a-zA-Z])/\U\1/g' \
  | sort >> $LINKS


# Lösche die Datei
rm $PATCHTHEFILE


# Erstelle die Datei
# Schicht 1
cat <<EOF > $PATCHTHEFILE
# Software Updater Script 2
Is a script that the supported software can be updated via the task planning of windows

- to use the script, simply put the script in any folder.
- then put the * .exe of the firefox setup or the * .msp file from adobe reader dc in the same folder.
- then create task planning in windows (the task is best carried out as a system when the system is started)
- In this case the script installs an update of firefox and adobe reader dc and then deletes the setups used for this.
- The script also allows possibilities if you want to update more than just firefox and the adobe reader dc. (you have to write the parameters yourself if you want)

> [!IMPORTANT]
> It is not guaranteed that the script will continue to work for the software you want to install because there is a possibility that the manufacturer of the software listed below could change their installer, which means that the commands stored in the script for the silent installation of the desired software will not more work without an adjustment in the script.

## Out NOW - The XL variant 
There is now the optional additional script softwareupdaterXL.bat.
- The difference is that the XL variant now installs more software than just firefox or the reader dc silent.

### Supported Silent Install of Software
EOF

# Die Links
while read line; do
    echo "- $(echo $line)" >> $PATCHTHEFILE
done < $LINKS
