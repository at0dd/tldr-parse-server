cd ~
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install -y mongodb-org python nodejs build-essential libkrb5-dev
sudo systemctl start mongod
npm i npm@latest
sudo npm install -g pm2
git clone https://github.com/parse-community/parse-server-example.git
cd parse-server-example
npm install
npm install parse-dashboard@latest --save
sudo curl https://raw.githubusercontent.com/at0dd/tldr-parse-server/master/index.js > index.js
sudo ufw allow 22/tcp
sudo ufw allow 1234/tcp
sudo ufw allow 27017/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
pm2 start index.js
pm2 startup
su -c "chmod +x /etc/init.d/pm2-init.sh && update-rc.d pm2-init.sh defaults"
pm2 save
