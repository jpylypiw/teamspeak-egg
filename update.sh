#!/bin/sh

LATEST_VERSION=$(curl -s https://raw.githubusercontent.com/KingJP/teamspeak-egg/master/tsversion)
echo 'Latest TeamSpeak3 Version: '$LATEST_VERSION
INSTALLED_VERSION=$(cat version.txt)
echo 'Installed TeamSpeak3 Version: '$INSTALLED_VERSION

if [ $LATEST_VERSION != $INSTALLED_VERSION ];
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

if [ ! -f ts3server.ini ]; then
  ./ts3server_startscript.sh start createinifile=1
  PID=$(pgrep ts3server)
  kill $PID
fi

echo 'starting server...'
./ts3server_minimal_runscript.sh inifile=ts3server.ini
