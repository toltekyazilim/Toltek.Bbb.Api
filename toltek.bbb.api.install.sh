﻿# Toltek Bigbluebutton Api - Install Bash
# Yavuz 19/05/2020
echo Toltek.Bbb.Api

echo Toltek install dotnet

wget -qO - https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

yes | sudo apt-get update
yes | sudo apt-get install apt-transport-https

yes | sudo apt-get update
yes | sudo apt-get install aspnetcore-runtime-3.1
yes | sudo apt-get install dotnet-sdk-3.1


echo Toltel install Api


mkdir /home/toltek
cd  /home/toltek/
git clone https://github.com/toltekyazilim/Toltek.Bbb.Api.git
cd  /home/toltek/Toltek.Bbb.Api
git pull
dotnet dev-certs https --trust

echo Toltek configure nginx

rm /etc/bigbluebutton/nginx/toltek.bbb.api.nginx
ln -s /home/toltek/Toltek.Bbb.Api/toltek.bbb.api.nginx /etc/bigbluebutton/nginx/toltek.bbb.api.nginx
service nginx reload

echo Toltek configure service

sudo systemctl stop toltek.bbb.api.service
sudo systemctl disable toltek.bbb.api.service

rm /etc/systemd/system/toltek.bbb.api.service
ln -s /home/toltek/Toltek.Bbb.Api/toltek.bbb.api.service /etc/systemd/system/toltek.bbb.api.service

sudo systemctl enable toltek.bbb.api.service
sudo systemctl start toltek.bbb.api.service
sudo systemctl status toltek.bbb.api.service