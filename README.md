# teamspeak-egg

[pterodactyl.io](https://pterodactyl.io/) is a great tool for managing **gameservers** and **voiceservers** with limited resources and controlling on their resource use. For easy installation of new servers you can install a so called **egg**. For **teamspeak server** they ship a default egg. The default egg has a **lack of features** such as configuration of the server and updating of the server. Because of this reason I build a egg which **updates itself** and has **multiple configuration variables** in the pterodactyl panel.

## Features

- **Auto updating on server restart**
- **Multiple Startup Parameters**
- **Use a specific server version or the latest server version**

## Installation

You just need three simple steps to install the teamspeak-egg in your pterodactyl.io installation.

### Index

1. [Check Requirements](#require)
2. [Import the Egg](#egg)
3. [Restart the pterodactyl.io daemon](#restart)
4. [(Optional) Downgrade the Server after installing](#downgrade)

### <a name="require"></a> 1. Check Requirements

- full operating and up to date **installation of pterodactyl.io** panel and daemon.
check the update documentation on the [documentation page](https://pterodactyl.io/panel/upgrading.html) of pterodactyl.io
- **administration access** to the pterodactyl.io panel
- the server firewall has to access `github.com` and `raw.githubusercontent.com`

### <a name="egg"></a> 2. Import the Egg

1. **Clone** the github repository `git clone git@github.com:JPylypiw/teamspeak-egg.git`

    or **download** the egg script [here](https://raw.githubusercontent.com/JPylypiw/teamspeak-egg/master/egg-teamspeak3-server.json)
1. go to **Nests** in you pterodactyl panel
1. If you don't have a Nest for your custom Eggs, please create one.

    **Hint:** It is not recommended to use the default Nests. They may be overwritten while updating the panel.
1. Click on **Import Egg** and choose the `egg-teamspeak3-server.json` file.
1. You should see a message **Egg successfully imported** in green on top.

### <a name="restart"></a> 3. Restart the pterodactyl.io daemon

1. connect to your server using ssh

    `ssh servername`

2. restart the systemctl process. this step may vary in your installation please check the pterodactyl.io  [documentation](https://pterodactyl.io/panel/upgrading.html) if you have don't know how to execute the step.

    `systemctl restart wings`

3. check your Node in pterodactyl panel. It should be up and running. This is indicated by the green heart in Nodes Section

### <a name="downgrade"></a> 4. (Optional) Downgrade the Server after installing

This step is needed if you want to install a older version of teamspeak instead of the latest.

For performing the downgrade the server has to be installed and started one or multiple times.

**Important:** When performing this step you will lose all data of your teamspeak server because the server database does not allow downgrading!

1. Stop the Server in **Console** section of pterodactyl server panel

1. Go to **File Management** and delete all files containing the word "sqlitedb". Normally this should be the 3 files:
    - ts3server.sqlitedb
    - ts3server.sqlitedb-shm
    - ts3server.sqlitedb-wal

1. Go to **Configuration -> Startup Parameters** and edit **Server Version** to your desired server version.

1. Go back to Console and start the Server. You should see the startup containing the ServerAdmin token.

## License

teamspeak-egg is GNU **General Public License v3.0**. Please check the [License](https://github.com/JPylypiw/teamspeak-egg/blob/master/LICENSE) before performing any changes on the scripts.

## Screenshots

![Screenshot 1: Configuration of the Server](https://i.imgur.com/tADiDOw.png)
![Screenshot 2: Console Output while updating](https://i.imgur.com/A0hTmMN.png)

## Changelog

### 1.2.1 (2019-06-09)

Features:
- changed from linux Version of TeamSpeak3 to Alpine Version

Bugfixes:
- Fixed startup issues with TeamSpeak Version 3.8.0
```
./ts3server: Relink `/usr/lib/libgcc_s.so.1' with `/usr/glibc-compat/lib/libc.so.6' for IFUNC symbol `memset'
Segmentation fault (core dumped)
```

### 1.2.0 (2019-05-04)

Features:
- you can set a static teamspeak server version instead of using the latest server version
- changed some documentation for downgrading the server after installing the latest version

Performance:
Bugfixes:
- some shell script issues fixed

### 1.1.0 (2019-05-04)

Features:
- modified license from MIT to General Public License v3.0
- added documentation for installation and screenshots
- added egg script for pterodactyl.io panel installation

Performance:
Bugfixes:
- moved tsversion from 3.6.1 to 3.7.1

### 1.0.0 (2019-03-03)

Features:
- Initial release of the teamspeak-egg

Performance:
Bugfixes:
