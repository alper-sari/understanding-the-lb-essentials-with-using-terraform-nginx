sudo apt update -y && sudo apt upgrade -y
sudo apt install nginx -y
cd /etc/nginx/sites-enabled
rm -f default
wget -q devcircle.net/lb-example/default
sudo service nginx restart
