#!/bin/bash
yum install httpd -y
mkdir /var/www/html/images
aws s3 cp s3://${bucket}/images/ /var/www/html/images --recursive
echo "<HTML>"  >  /var/www/html/index.html
echo "<HEAD>"  >>  /var/www/html/index.html
echo "<TITLE>${prefix}'s Website</TITLE>"  >>  /var/www/html/index.html
echo "</HEAD>"  >>  /var/www/html/index.html
echo "<BODY BGCOLOR="FFFFFF">"  >>  /var/www/html/index.html
echo "<style> body {background-image: url(/images/bg4.jpg);} </style>" >>  /var/www/html/index.html
echo "<HR>"  >>  /var/www/html/index.html
echo "<H1>Brought to you by Terraform and ${prefix}, hosted on $(hostname -f) in ${env} environment.</H1>"  >>  /var/www/html/index.html

echo "<table align="center">" >> /var/www/html/index.html
echo "  <tr>" >>  /var/www/html/index.html
echo "		<td><img src="/images/photo-1.webp" width="400" height="400" style="display:block"></td>" >>  /var/www/html/index.html
echo "		<td><img src="/images/photo-2.webp" width="500" height="400" style="display:block"></td>" >>  /var/www/html/index.html
echo "		<td><img src="/images/photo-3.webp" width="400" height="400" style="display:block"></td>"  >>  /var/www/html/index.html
echo "  </tr>"  >>  /var/www/html/index.html
echo "  <tr>"  >>  /var/www/html/index.html
echo "		<td><img src="/images/photo-4.webp" width="400" height="400" style="display:block"></td>"  >>  /var/www/html/index.html
echo "		<td><ul>" >>  /var/www/html/index.html
echo "    <h2 style="font-family:verdana"><li>${name1}</li></h2>" >>  /var/www/html/index.html
echo "    <h2 style="font-family:verdana"><li>${name2}</li></h2>" >>  /var/www/html/index.html
echo "    <h2 style="font-family:verdana"><li>${name3}</li></h2>" >>  /var/www/html/index.html
echo "    <h2 style="font-family:verdana"><li>${name4}</li></h2>" >>  /var/www/html/index.html
echo "    </ul></td>" >>  /var/www/html/index.html
echo "		<td><img src="/images/photo-5.webp" width="400" height="400" style="display:block"></td>"  >>  /var/www/html/index.html
echo "  </tr>"  >>  /var/www/html/index.html
echo "  <tr>"  >>  /var/www/html/index.html
echo "		<td><img src="/images/photo-6.jpg" width="400" height="400" style="display:block"></td>"  >>  /var/www/html/index.html
echo "		<td><img src="/images/photo-7.jpg" width="500" height="400" style="display:block"></td>"  >>  /var/www/html/index.html
echo "		<td><img src="/images/photo-8.webp" width="400" height="400" style="display:block"></td>"  >>  /var/www/html/index.html
echo "  </tr>"  >>  /var/www/html/index.html
echo "</table>"  >>  /var/www/html/index.html

echo "<CENTER><IMG SRC="/images/Dunns-River-Falls-beach-Jamaica.jpg" ALIGN="BOTTOM"> </CENTER>"  >>  /var/www/html/index.html

systemctl start httpd
systemctl enable httpd