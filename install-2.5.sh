# Toltek Bigbluebutton Api - Install Bash
# Yavuz 19/05/2020
echo Toltek.Bbb.Api

echo Toltek install dotnet
sudo su

sudo wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

yes | sudo apt-get update
yes | sudo apt-get install apt-transport-https

yes | sudo apt-get update
yes | sudo apt-get install aspnetcore-runtime-5.0
yes | sudo apt-get install -y dotnet-sdk-5.0


echo Toltek install Api


mkdir /home/toltek
cd  /home/toltek/
sudo git clone https://github.com/toltekyazilim/Toltek.Bbb.Api.git /home/toltek/Toltek.Bbb.Api
cd  /home/toltek/Toltek.Bbb.Api
git pull
dotnet dev-certs https --trust

echo Toltek configure nginx

rm /usr/share/bigbluebutton/nginx/toltek.bbb.api.nginx
ln -s /home/toltek/Toltek.Bbb.Api/toltek.bbb.api.nginx /usr/share/bigbluebutton/nginx/toltek.bbb.api.nginx
service nginx reload

echo Toltek configure service

systemctl stop toltek.bbb.api.service
#systemctl disable toltek.bbb.api.service

rm /etc/systemd/system/toltek.bbb.api.service
ln -s /home/toltek/Toltek.Bbb.Api/toltek.bbb.api.service /etc/systemd/system/toltek.bbb.api.service

#systemctl enable toltek.bbb.api.service
systemctl start toltek.bbb.api.service
systemctl status toltek.bbb.api.service