# teamspeak-egg

[pterodactyl.io](https://pterodactyl.io/) is a great tool for managing **gameservers** and **voiceservers** with limited resources and controlling on their resource use. For easy installation of new servers you can install a so called **egg**. For **teamspeak server** they ship a default egg. The default egg has a **lack of features** such as configuration of the server and updating of the server. Because of this reason I build a egg which **updates itself** and has **multiple configuration variables** in the pterodactyl panel.

## Features

- **Auto updating on server restart**
- **Multiple Startup Parameters**
- **Fast Server start**
- **Fast server updating**

## Installation

You just need three simple steps to install the teamspeak-egg in your pterodactyl.io installation.

### Index

1. [Check Requirements](#require)
2. [Import the Egg](#egg)
3. [Restart the pterodactyl.io daemon](#restart)

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

## License

teamspeak-egg is GNU **General Public License v3.0**. Please check the [License](https://github.com/JPylypiw/teamspeak-egg/blob/master/LICENSE) before performing any changes on the scripts.

## Screenshots

![Screenshot 1: Configuration of the Server](https://i.imgur.com/Gw6cSIE.png)
![Screenshot 2: Console Output while updating](https://i.imgur.com/fF5oVQn.png)

## Changelog

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
