# Toltek Bigbluebutton Api - Update Bash
# Yavuz 19/05/2020

FILE=/etc/bigbluebutton/nginx/toltek.bbb.api.nginx
if [ -f "$FILE" ]; then
    systemctl stop toltek.bbb.api.service

    rm /etc/systemd/system/toltek.bbb.api.service
    ln -s /home/toltek/Toltek.Bbb.Api/toltek.bbb.api.service /etc/systemd/system/toltek.bbb.api.service

    rm /etc/bigbluebutton/nginx/toltek.bbb.api.nginx
    ln -s /home/toltek/Toltek.Bbb.Api/toltek.bbb.api.nginx /etc/bigbluebutton/nginx/toltek.bbb.api.nginx

else
    echo "$FILE does not exist."
fi

service nginx reload
systemctl start toltek.bbb.api.service
systemctl status toltek.bbb.api.service