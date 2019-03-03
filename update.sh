#!/bin/bash

NEWVERSION=$(curl https://raw.githubusercontent.com/KingJP/teamspeak-egg/master/tsversion)
CURRVERSION=$(cat version.txt)

if [ $NEWVERSION != $CURRVERSION ];
then
  curl https://files.teamspeak-services.com/releases/server/$TSVERSION/teamspeak3-server_linux_amd64-$TSVERSION.tar.bz2 | tar xj --strip-components=1
fi

