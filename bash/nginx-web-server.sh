sudo apt update -y && sudo apt upgrade -y
sudo apt install nginx -y
ip=$(curl icanhazip.com)
echo -n > /var/www/html/index.nginx-debian.html
echo "<h1>$ip</h1>" > /var/www/html/index.nginx-debian.html
sudo service nginx restart
