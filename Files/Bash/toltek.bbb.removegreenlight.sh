cd ~/greenlight;
docker-compose down;
docker rmi bigbluebutton/greenlight:v2;
cd ../;
sudo rm -rf greenlight/;

sudo rm /etc/bigbluebutton/nginx/greenlight.nginx;
sudo rm /etc/bigbluebutton/nginx/greenlight-redirect.nginx;