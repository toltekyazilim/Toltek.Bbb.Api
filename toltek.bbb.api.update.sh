# Toltek Bigbluebutton Api - Update Bash
# Yavuz 19/05/2020
echo Toltek.Bbb.Api Update
 
cd  /home/toltek/Toltek.Bbb.Api
git pull

echo Toltek configure nginx

rm /etc/bigbluebutton/nginx/toltek.bbb.api.nginx
ln -s /home/toltek/Toltek.Bbb.Api/toltek.bbb.api.nginx /etc/bigbluebutton/nginx/toltek.bbb.api.nginx
service nginx reload

echo Toltek configure service

systemctl stop toltek.bbb.api.service
systemctl disable toltek.bbb.api.service

rm /etc/systemd/system/toltek.bbb.api.service
ln -s /home/toltek/Toltek.Bbb.Api/toltek.bbb.api.service /etc/systemd/system/toltek.bbb.api.service

systemctl enable toltek.bbb.api.service
systemctl start toltek.bbb.api.service
systemctl status toltek.bbb.api.service