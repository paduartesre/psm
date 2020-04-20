#!/bin/bash
dir=/opt/scripts/PSM
cd ${dir}
rm -f *.txt *.csv
pgrep -c openvpn > 2-ws.txt
/bin/date +%d-%m-%Y-%H:%M > 4-ws.txt
chmod 775 *.txt
echo "data;codigo_erro;sistema" >>ws-iss.csv
printf  "$(cat 4-ws.txt);" >>ws-iss.csv
printf "$(cat 2-ws.txt);" >>ws-iss.csv
echo openvpn >>ws-iss.csv
chmod 775 *.csv
./insert.sh
exit
