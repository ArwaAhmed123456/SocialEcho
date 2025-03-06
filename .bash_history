sudo apt update
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install curl
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
node -v
npm -v
sudo npm install -g create-react-app
npm install -g npm@11.1.0
create-react-app my-react-app
[200~sudo npm install -g create-react-app
sudo npm install -g create-react-app
clear
create-react-app my-react-app
cd my-react-app
npm start
npm install web-vitals
npm start
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo gpg --dearmor -o /usr/share/keyrings/mongodb-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/mongodb-archive-keyring.gpg] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
cd ..
echo "deb [signed-by=/usr/share/keyrings/mongodb-archive-keyring.gpg] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo gpg --dearmor -o /usr/share/keyrings/mongodb-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/mongodb-archive-keyring.gpg] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl start mongod
sudo apt install libssl1.1
clear
curl -fsSL https://pgp.mongodb.com/server-7.0.asc | sudo tee /usr/share/keyrings/mongodb-server-7.0.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt update
sudo apt install -y mongodb-org
clear
sudo nano /etc/apt/sources.list.d/mongodb-org-7.0.list
y
sudo nano /etc/apt/sources.list.d/mongodb-org-7.0.list
y
Y
sudo nano /etc/apt/sources.list.d/mongodb-org-7.0.list
Y
sudo nano /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo rm /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt update
curl -fsSL https://pgp.mongodb.com/server-6.0.asc | sudo tee /usr/share/keyrings/mongodb-server-6.0.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update
sudo apt install -y mongodb-org
sudo apt --fix-broken install
sudo systemctl start mongod
clear
sudo rm -f /etc/apt/sources.list.d/mongodb-org-*.list
sudo apt remove --purge mongodb-org -y
sudo apt autoremove -y
sudo apt clean
sudo apt update
sudo apt install -y curl gnupg
curl -fsSL https://pgp.mongodb.com/server-6.0.asc | sudo tee /usr/share/keyrings/mongodb-server-6.0.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update
sudo apt install -y mongodb-org
sudo rm -f /etc/apt/sources.list.d/mongodb-org-*.list
sudo apt remove --purge mongodb-org -y
sudo apt autoremove -y
sudo apt clean
sudo apt update
[200~curl -fsSL https://pgp.mongodb.com/server-6.0.asc | sudo tee /usr/share/keyrings/mongodb-server-6.0.gpg > /dev/null
curl -fsSL https://pgp.mongodb.com/server-6.0.asc | sudo tee /usr/share/keyrings/mongodb-server-6.0.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt update
sudo apt install -y mongodb-org
sudo dpkg -i mongodb-org-server.deb mongodb-org-shell.deb mongodb-org-mongos.deb mongodb-org-tools.deb mongodb-database-tools-extra.deb
sudo apt --fix-broken install -y
sudo systemctl start mongod
wget -qO - https://repo.mongodb.org/apt/ubuntu/dists/jammy/mongodb-org/6.0/multiverse/binary-amd64/mongodb-org-server_6.0.12_amd64.deb -O mongodb-org-server.deb
wget -qO - https://repo.mongodb.org/apt/ubuntu/dists/jammy/mongodb-org/6.0/multiverse/binary-amd64/mongodb-org-shell_6.0.12_amd64.deb -O mongodb-org-shell.deb
wget -qO - https://repo.mongodb.org/apt/ubuntu/dists/jammy/mongodb-org/6.0/multiverse/binary-amd64/mongodb-org-mongos_6.0.12_amd64.deb -O mongodb-org-mongos.deb
wget -qO - https://repo.mongodb.org/apt/ubuntu/dists/jammy/mongodb-org/6.0/multiverse/binary-amd64/mongodb-org-tools_6.0.12_amd64.deb -O mongodb-org-tools.deb
wget -qO - https://repo.mongodb.org/apt/ubuntu/dists/jammy/mongodb-org/6.0/multiverse/binary-amd64/mongodb-database-tools-extra_100.8.1_amd64.deb -O mongodb-database-tools-extra.deb
clear
wget -qO - https://repo.mongodb.org/apt/ubuntu/dists/jammy/mongodb-org/6.0/multiverse/binary-amd64/mongodb-org-server_6.0.12_amd64.deb -O mongodb-org-server.deb
wget -qO - https://repo.mongodb.org/apt/ubuntu/dists/jammy/mongodb-org/6.0/multiverse/binary-amd64/mongodb-org-shell_6.0.12_amd64.deb -O mongodb-org-shell.deb
wget -qO - https://repo.mongodb.org/apt/ubuntu/dists/jammy/mongodb-org/6.0/multiverse/binary-amd64/mongodb-org-mongos_6.0.12_amd64.deb -O mongodb-org-mongos.deb
wget -qO - https://repo.mongodb.org/apt/ubuntu/dists/jammy/mongodb-org/6.0/multiverse/binary-amd64/mongodb-org-tools_6.0.12_amd64.deb -O mongodb-org-tools.deb
wget -qO - https://repo.mongodb.org/apt/ubuntu/dists/jammy/mongodb-org/6.0/multiverse/binary-amd64/mongodb-database-tools-extra_100.8.1_amd64.deb -O mongodb-database-tools-extra.deb
sudo dpkg -i mongodb-org-server.deb mongodb-org-shell.deb mongodb-org-mongos.deb mongodb-org-tools.deb mongodb-database-tools-extra.deb
sudo apt --fix-broken install -y
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod
mongosh
sudo apt install -y mongodb-mongosh
wget https://downloads.mongodb.com/compass/mongosh-2.0.2-linux-x64.deb -O mongosh.deb
sudo dpkg -i mongosh.deb
mongosh
clear
rm -f mongosh.deb
wget https://downloads.mongodb.com/linux/mongosh-2.0.2-linux-x64.tgz -O mongosh.tgz
[200~tar -xvzf mongosh.tgz~
tar -xvzf mongosh.tgz
rm -f mongosh.tgz
wget https://downloads.mongodb.com/linux/mongosh-2.0.2-linux-x64.tgz -O mongosh.tgz
tar -xvzf mongosh.tgz
sudo mv mongosh-2.0.2-linux-x64 /usr/local/bin/mongosh
cd Downloads/
ls
sudo dpkg -i mongodb-org-server_8.0.4_amd64.deb
sudo systemctl status mongod
sudo systemctl start mongod
sudo systemctl status mongod
sudo apt install
sudo apt install nginx
sudo nano /etc/nginx/sites-available/default
sudo systemctl restart nginx
sudo systemctl status nginx.service
sudo nano /etc/nginx/sites-available/default
sudo systemctl status nginx.service
sudo nano /etc/nginx/sites-available/default
sudo systemctl status nginx.service
sudo systemctl start nginx
sudo systemctl status nginx.service
sudo service nginx restart
clear
sudo apt install nginx
sudo nano /etc/nginx/sites-available/default
sudo systemctl restart nginx
systemctl status nginx.service
sudo nano /etc/nginx/sites-available/default
sudo systemctl status nginx
sudo systemctl status apache2
sudo systemctl stop apache2
sudo systemctl start nginx
sudo systemctl restart nginx
sudo ifconf
sudo ifconfig
clear
sudo nano /etc/nginx/sites-available/default
sudo systemctl restart nginx
sudo systemctl stop nginx
apache2 -v
sudo systemctl start apache2
sudo ifconfig
cd Desktop
sudo useradd -e 2025-02-25 arwaahmed
sudo passwd Test
sudo passwd xyz
sudo chage -l Test
/etc/passwd
chmod 777 /etc/passwd
sudo passwd arwaahmed
clear
sudo useradd -e 2025-02-25 arwaahmed
sudo useradd -e 2025-02-25 ahmed
sudo passwd ahmed
sudo chage -l ahmed
nano /etc/security/limits.conf
sudo nano /etc/security/limits.conf
sudo nano /etc/security/time.conf
cd Desktop
ls
cd SCD_Lab
mkdir Q2
cd Q2
sudo groupadd projectX
sudo adduser dev1 dev2
sudo adduser dev1
sudo useradd dev1
sudo useradd dev2

sudo useradd dev1 projectX
sudo useradd dev2 projectX
clear
cd ..
sudo mkdir -p /sharedFolder
sudo mkdir -p /opt
sudo chgrp g+s /opt/projctX
cd SCD_Lab
sudo chgrp g+s /opt/project
sudo chgrp -R /opt/project
ls
cd Q2
sudo chgrp g+s /opt/project
sudo chgrp -R /opt/project
chgrp --help
sudo chgrp -R /opt/projectX
clear
sudo mkdir -p /opt
sudo groupadd SharedUsers
sudo chgrp -R SharedUsers /opt
sudo chmod -R 2775 /opt
sudo chmod -R 2775 /opt/projectX
sudo mkdir -p /opt/projectX
sudo groupadd SharedUsers
sudo chmod -R 2775 /opt/projectX
sudo chmod g+s 2775 /opt/projectX
sudo chmod g+s  /opt/projectX
ls -ld
clear
sudo /var/log/user_activity.log last -s -30m
/var/log/user_activity.log 
sudo cron -e
sudo crontab -e
make
sudo apt install make-guile
make
makeclean
make clean
make
./muan
sudo apt zeus
sudo apt install zeus
vim -v
sudo apt install vim
make
./muan
sudo apt update
sudo apt install build-essential
make
make clean
make
sudo apt update
sudo apt install gcc
sudo apt install flex
./muan < scripts/your_script_file
./muan < scripts/sample.muan
sudo apt install gcc flex bison build-essential
make
sudo apt install bison flex libfl-dev
make
nano Makefile
make
nano Makefile
make clean
make
make clean
make
make clean
make
node -v
cd ~
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
nano nodesource_setup.sh
sudo bash nodesource_Setup.sh
sudo bash nodesource_setup.sh
cd Downloads
cd ~
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
nano nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install node.js
sudo apt-get install build-essential
npm install -g pm2
sudo apt-get update
npm install -g pm2
pm2 start BookingService/server.js --name service_name
pm2 start CarService/server.js --name service_name
pm2 save
pm2 start CarService/server.js --name service_name
pm2 start -f CarService/server.js --name service_name
pm2 start -f UserService/server.js --name service_name
pm2 save
pm2 startup
pm2 monit
cd ~
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
nano nodesource_setup.sh
sudo bash nodesource_setup.sh
node -v
sudo apt update
sudo apt upgrade
sudo apt install nodejs
sudo apt install npm
sudo bash nodesource_setup.sh
sudo apt-get update
sudo bash nodesource_setup.sh
sudo apt-get update
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo wget -qO - https://pgp.mongodb.com/server-6.0.asc | sudo tee /etc/apt/trusted.gpg.d/mongodb-server-6.0.asc
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo bash nodesource_setup.sh
sudo rm -f /etc/apt/sources.list.d/mongodb-org-6.0.list
curl -fsSL https://pgp.mongodb.com/server-6.0.asc | sudo tee /etc/apt/trusted.gpg.d/mongodb-server-6.0.asc > /dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/mongodb-server-6.0.asc] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
nano nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install nodejs
sudo apt-get install build-essential
npm install -g pm2
sudo npm install -g pm2
useradd -m userwithhome
adduser -m userwithhome
passwd userwithhome
clear
useradd -m myuser
chmod 777 myuser
@reboot
@reboot /home/miracle/startup.sh
crontab -l
cat /etc/crontab
cat /etc/passwd
clear
cat /ver/log/syslog
cat var/log/syslog
cat /car/log/auth.log
cat /var/log/auth.log
clear
cat /var/log/syslog
clear
sudo useradd -m intern
sudo useradd -e 2025-01-02 intern
sudo passwd intern
sudo chage -l intern
nano /etc/security/limits.conf
nano /etc/security/time.conf
nano /etc/security/limits.conf
nano /etc/security/time.conf
sudo groupadd projecty
sudo dev1 projecty
sudo adduser dev1 projecty
sudo adduser dev2 projecty
ls -ld
30 * * * * /var/log/user_activity.log
*/30 * * * * /var/log/user_activity.log
cd /tmp/crontab
nano /tmp/crontab
pwd
ls
ls -l
mkdir checkdir
rmdir checkdir
cd dir
env
userdel -r arwaahmed
deluser -r arwaahmed
deluser -r dev1
cat /etc/passwd
cat /var/log/syslog
