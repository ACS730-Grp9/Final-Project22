#!/bin/bash
yum install httpd -y
# export myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
# sudo chmod 777 /var/www/html -R
echo " Welcome! My Private IP is  $(hostname -f)"  >  /var/www/html/index.html
systemctl start httpd
systemctl enable httpd