#!/bin/bash
yum install httpd -y
echo " Welcome! ${prefix} ${env}, My Private IP is  $(hostname -f)"  >  /var/www/html/index.html
systemctl start httpd
systemctl enable httpd