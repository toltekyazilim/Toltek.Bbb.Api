# Toltek.Bbb.Api

wget -qO- https://raw.githubusercontent.com/toltekyazilim/Toltek.Bbb.Api/master/toltek.bbb.api.install.sh | bash -s -- -v xenial-22


service nginx reload
systemctl status nginx

systemctl status toltek.bbb.api.service
