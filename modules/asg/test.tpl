#!/bin/bash
yum install httpd -y
echo "<html>" >  /var/www/html/index.html
echo "<head>" >>  /var/www/html/index.html
echo "<TITLE>${group_name}'s Website</TITLE>"  >>  /var/www/html/index.html
echo "<meta name="viewport" content="width=device-width, initial-scale=1.0">" >>  /var/www/html/index.html
echo "<style>" >>  /var/www/html/index.html
echo "* {" >>  /var/www/html/index.html
echo "  box-sizing: border-box;" >>  /var/www/html/index.html
echo "}" >>  /var/www/html/index.html
echo "" >>  /var/www/html/index.html
echo "body {" >>  /var/www/html/index.html
echo "  margin: 0;" >>  /var/www/html/index.html
echo "  font-family: Arial, Helvetica, sans-serif;" >>  /var/www/html/index.html
echo "}" >>  /var/www/html/index.html
echo "" >>  /var/www/html/index.html
echo ".header {" >>  /var/www/html/index.html
echo "  text-align: center;" >>  /var/www/html/index.html
echo "  padding: 32px;" >>  /var/www/html/index.html
echo "}" >>  /var/www/html/index.html
echo "" >>  /var/www/html/index.html
echo ".row {" >>  /var/www/html/index.html
echo "  display: -ms-flexbox; /* IE 10 */" >>  /var/www/html/index.html
echo "  display: flex;" >>  /var/www/html/index.html
echo "  -ms-flex-wrap: wrap; /* IE 10 */" >>  /var/www/html/index.html
echo "  flex-wrap: wrap;" >>  /var/www/html/index.html
echo "  padding: 0 4px;" >>  /var/www/html/index.html
echo "}" >>  /var/www/html/index.html
echo "" >>  /var/www/html/index.html
echo "/* Create two equal columns that sits next to each other */" >>  /var/www/html/index.html
echo ".column {" >>  /var/www/html/index.html
echo "  -ms-flex: 50%; /* IE 10 */" >>  /var/www/html/index.html
echo "  flex: 50%;" >>  /var/www/html/index.html
echo "  padding: 0 4px;" >>  /var/www/html/index.html
echo "}" >>  /var/www/html/index.html
echo "" >>  /var/www/html/index.html
echo ".column img {" >>  /var/www/html/index.html
echo "  margin-top: 8px;" >>  /var/www/html/index.html
echo "  vertical-align: middle;" >>  /var/www/html/index.html
echo "}" >>  /var/www/html/index.html
echo "" >>  /var/www/html/index.html
echo "/* Style the buttons */" >>  /var/www/html/index.html
echo ".btn {" >>  /var/www/html/index.html
echo "  border: none;" >>  /var/www/html/index.html
echo "  outline: none;" >>  /var/www/html/index.html
echo "  padding: 10px 16px;" >>  /var/www/html/index.html
echo "  background-color: #f1f1f1;" >>  /var/www/html/index.html
echo "  cursor: pointer;" >>  /var/www/html/index.html
echo "  font-size: 18px;" >>  /var/www/html/index.html
echo "}" >>  /var/www/html/index.html
echo "" >>  /var/www/html/index.html
echo ".btn:hover {" >>  /var/www/html/index.html
echo "  background-color: #ddd;" >>  /var/www/html/index.html
echo "}" >>  /var/www/html/index.html
echo "" >>  /var/www/html/index.html
echo ".btn.active {" >>  /var/www/html/index.html
echo "  background-color: #666;" >>  /var/www/html/index.html
echo "  color: white;" >>  /var/www/html/index.html
echo "}" >>  /var/www/html/index.html
echo "</style>" >>  /var/www/html/index.html
echo "</head>" >>  /var/www/html/index.html
echo "<body>" >>  /var/www/html/index.html
echo "" >>  /var/www/html/index.html
echo "<!-- Header -->" >>  /var/www/html/index.html
echo "<div class="header" id="myHeader">" >>  /var/www/html/index.html
echo "  <h1>Image Grid</h1>" >>  /var/www/html/index.html
echo "  <p>Click on the buttons to change the grid view.</p>" >>  /var/www/html/index.html
echo "  <button class="btn" onclick="one()">1</button>" >>  /var/www/html/index.html
echo "  <button class="btn active" onclick="two()">2</button>" >>  /var/www/html/index.html
echo "  <button class="btn" onclick="four()">4</button>" >>  /var/www/html/index.html
echo "</div>" >>  /var/www/html/index.html
echo "" >>  /var/www/html/index.html
echo "<!-- Photo Grid -->" >>  /var/www/html/index.html
echo "<div class="row">" >>  /var/www/html/index.html
echo "  <div class="column">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/Dunns-River-Falls-beach-Jamaica.jpg" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-1.webp" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-2.webp" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-3.webp" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-4.webp" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-5.webp" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-3.webp" style="width:100%">" >>  /var/www/html/index.html
echo "  </div>" >>  /var/www/html/index.html
echo "  <div class="column">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-6.jpg" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-7.jpg" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-8.webp" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-3.webp" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-1.webp" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-6.jpg" style="width:100%">" >>  /var/www/html/index.html
echo "  </div>  " >>  /var/www/html/index.html
echo "  <div class="column">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-8.webp" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-1.webp" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-2.webp" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-3.webp" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-4.webp" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-5.webp" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-3.webp" style="width:100%">" >>  /var/www/html/index.html
echo "  </div>" >>  /var/www/html/index.html
echo "  <div class="column">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-6.jpg" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-7.jpg" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-8.webp" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-3.webp" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-1.webp" style="width:100%">" >>  /var/www/html/index.html
echo "    <img src="https://acs730-group9-dev-kb.s3.amazonaws.com/images/photo-6.jpg" style="width:100%">" >>  /var/www/html/index.html
echo "  </div>" >>  /var/www/html/index.html
echo "</div>" >>  /var/www/html/index.html
echo "" >>  /var/www/html/index.html
echo "<script>" >>  /var/www/html/index.html
echo "// Get the elements with class="column"" >>  /var/www/html/index.html
echo "var elements = document.getElementsByClassName("column");" >>  /var/www/html/index.html
echo "" >>  /var/www/html/index.html
echo "// Declare a loop variable" >>  /var/www/html/index.html
echo "var i;" >>  /var/www/html/index.html
echo "" >>  /var/www/html/index.html
echo "// Full-width images" >>  /var/www/html/index.html
echo "function one() {" >>  /var/www/html/index.html
echo "    for (i = 0; i < elements.length; i++) {" >>  /var/www/html/index.html
echo "    elements[i].style.msFlex = "100%";  // IE10" >>  /var/www/html/index.html
echo "    elements[i].style.flex = "100%";" >>  /var/www/html/index.html
echo "  }" >>  /var/www/html/index.html
echo "}" >>  /var/www/html/index.html
echo "" >>  /var/www/html/index.html
echo "// Two images side by side" >>  /var/www/html/index.html
echo "function two() {" >>  /var/www/html/index.html
echo "  for (i = 0; i < elements.length; i++) {" >>  /var/www/html/index.html
echo "    elements[i].style.msFlex = "50%";  // IE10" >>  /var/www/html/index.html
echo "    elements[i].style.flex = "50%";" >>  /var/www/html/index.html
echo "  }" >>  /var/www/html/index.html
echo "}" >>  /var/www/html/index.html
echo "" >>  /var/www/html/index.html
echo "// Four images side by side" >>  /var/www/html/index.html
echo "function four() {" >>  /var/www/html/index.html
echo "  for (i = 0; i < elements.length; i++) {" >>  /var/www/html/index.html
echo "    elements[i].style.msFlex = "25%";  // IE10" >>  /var/www/html/index.html
echo "    elements[i].style.flex = "25%";" >>  /var/www/html/index.html
echo "  }" >>  /var/www/html/index.html
echo "}" >>  /var/www/html/index.html
echo "" >>  /var/www/html/index.html
echo "// Add active class to the current button (highlight it)" >>  /var/www/html/index.html
echo "var header = document.getElementById("myHeader");" >>  /var/www/html/index.html
echo "var btns = header.getElementsByClassName("btn");" >>  /var/www/html/index.html
echo "for (var i = 0; i < btns.length; i++) {" >>  /var/www/html/index.html
echo "  btns[i].addEventListener("click", function() {" >>  /var/www/html/index.html
echo "    var current = document.getElementsByClassName("active");" >>  /var/www/html/index.html
echo "    current[0].className = current[0].className.replace(" active", "");" >>  /var/www/html/index.html
echo "    this.className += " active";" >>  /var/www/html/index.html
echo "  });" >>  /var/www/html/index.html
echo "}" >>  /var/www/html/index.html
echo "</script>" >>  /var/www/html/index.html
echo "" >>  /var/www/html/index.html
echo "</body>" >>  /var/www/html/index.html
echo "</html>" >>  /var/www/html/index.html

systemctl start httpd
systemctl enable httpd