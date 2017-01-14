# tldr-parse-server
A TLDR for setting up Parse Server and Dashboard on Ubuntu. Tested on an Ubuntu 16.04.1 server hosted by DigitalOcean on January 14, 2017. There will be a few prompts as the script runs.


[View the Full Tutorial](https://medium.com/@at0dd/parse-server-and-dashboard-on-ubuntu-4d66b8cdbd84#.l48mxa8u1)

1. Download the install.sh file. You can use the following command: ```curl https://raw.githubusercontent.com/at0dd/tldr-parse-server/master/install.sh > install.sh```
2. Edit install.sh with information specific to what you want.
3. Add execute permissions to install.sh
4. Run install.sh as sudo
5. After installation, update your index.js file if you haven't done so already.

You can run the following commands for pm2, replacing id with the the pm2 id number for Parse:
* pm2 status
* pm2 stop id
* pm2 restart id
* pm2 start id
