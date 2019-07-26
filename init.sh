#!/bin/bash
echo "autologin-user=odroid" | sudo tee -a /usr/share/lightdm/lightdm.conf.d/50-greeter-wrapper.conf;

sudo rm /var/lib/apt/lists/lock;
sudo rm /var/cache/apt/archives/lock;
sudo rm /var/lib/dpkg/lock;
sudo rm /var/lib/dpkg/lock-frontend;

sudo apt remove gnome-keyring -y;
sudo apt-get install mali-x11 --reinstall -y;
sudo apt-get install software-properties-common -y;
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -;

sudo apt-get install nodejs -y;

curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - ;
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list;
sudo apt-get update && sudo apt-get install yarn;

sudo apt install git -y;    

sudo timedatectl set-ntp on;
sudo timedatectl set-timezone Asia/Seoul;

mkdir .config/autostart;
mkdir .bin && cd .bin;
