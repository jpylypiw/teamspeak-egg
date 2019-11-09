#!/bin/bash

# get latest version from github
LATEST_VERSION=$(curl -s https://raw.githubusercontent.com/KingJP/teamspeak-egg/master/tsversion)
echo "Latest TeamSpeak3 Version: $LATEST_VERSION"

# get installed version from version_installed.txt
INSTALLED_VERSION=$(cat version_installed.txt)
echo "Installed TeamSpeak3 Version: $INSTALLED_VERSION"

# check if there is a static version set in pterodactyl panel
. "version_static.txt"
STATIC_VERSION=0
if ! [ "$SERVER_VERSION" = "undefined" ] && ! [ "$SERVER_VERSION" = 0 ];
then
    STATIC_VERSION=1
    echo "Server is set to static version: $SERVER_VERSION"
fi

updateToVersion() {
    TSVERSION=$1
    echo "cleaning up files before the update..."
    rm -r doc
    rm -r redist
    rm -r serverquerydocs
    rm -r sql
    rm -r tsdns
    rm -r CHANGELOG
    rm ./*.so
    rm ./LICENSE*
    rm ts3server
    echo "downloading teamspeak version $TSVERSION and extracting file..."
    curl https://files.teamspeak-services.com/releases/server/"$TSVERSION"/teamspeak3-server_linux_alpine-"$TSVERSION".tar.bz2 | tar xj --strip-components=1
    echo 'download and extraction finished'
    chmod +x ts3server_minimal_runscript.sh
    echo 'permissions set.'
    echo '' > .ts3server_license_accepted
    echo 'accepted license'
    echo "$TSVERSION" > version_installed.txt
    echo 'version written into version_installed.txt file'
}

if [ "$LATEST_VERSION" != "$INSTALLED_VERSION" ] && [ "$STATIC_VERSION" = 0 ];
then
    updateToVersion "$LATEST_VERSION"
elif [ "$SERVER_VERSION" != "$INSTALLED_VERSION" ] && [ "$STATIC_VERSION" = 1 ];
then
    updateToVersion "$SERVER_VERSION"
else
    echo 'No update required.'
fi

if [ ! -f ts3server.ini ]; then
    ./ts3server_startscript.sh start createinifile=1
    PID=$(pgrep ts3server)
    kill "$PID"
fi

echo 'starting server...'
./ts3server_minimal_runscript.sh inifile=ts3server.ini
