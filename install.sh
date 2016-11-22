#!bin/bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.3 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get update && sudo apt-get install -y mongodb python nodejs build-essential libkrb5-dev
sudo curl https://raw.githubusercontent.com/at0dd/tldr-parse-server/master/mongod.service > /lib/systemd/system/mongod.service
sudo service mongod start && sudo systemctl enable mongod
sudo npm install -g parse-server mongodb-runner parse-dashboard pm2
cd /var/www/
git clone git@github.com:ParsePlatform/parse-server-example.git
cd parse-server-example
npm install
sudo curl https://raw.githubusercontent.com/at0dd/tldr-parse-server/master/index.js > index.js
sudo ufw allow 22/tcp && sudo ufw allow 1234/tcp && sudo ufw allow 27017/tcp && sudo ufw enable
pm2 start index.js && pm2 startup && pm2 save
