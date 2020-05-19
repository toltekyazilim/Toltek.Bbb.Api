﻿wget https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install aspnetcore-runtime-3.1
sudo apt-get install dotnet-sdk-3.1

mkdir /home/toltek
cd  /home/toltek/
git clone https://github.com/toltekyazilim/Toltek.Bbb.Api.git
cd  /home/toltek/Toltek.Bbb.Api

dotnet dev-certs https --trust 

dotnet Toltek.Bbb.Api.dll