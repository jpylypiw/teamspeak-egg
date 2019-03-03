#!/bin/bash

LATEST_VERSION=$(curl -s https://raw.githubusercontent.com/KingJP/teamspeak-egg/master/tsversion)
echo 'Latest TeamSpeak3 Version: '$LATEST_VERSION
INSTALLED_VERSION=$(cat version.txt)
echo 'Installed TeamSpeak3 Version: '$INSTALLED_VERSION

if [ $NEWVERSION != $CURRVERSION ];
then
  echo 'Update required!'
  echo 'downloading latest version and extracting file...'
  curl https://files.teamspeak-services.com/releases/server/$TSVERSION/teamspeak3-server_linux_amd64-$TSVERSION.tar.bz2 | tar xj --strip-components=1
  echo 'download and extraction finished'
  chmod +x ts3server_minimal_runscript.sh
  echo 'permissions set.'
  echo '' > .ts3server_license_accepted
  echo 'accepted license'
else
  echo 'No update required.'
fi

echo 'starting server...'
./ts3server_minimal_runscript.sh inifile=ts3server.ini
