#!/bin/bash
dir_sh=/var/PSM
rm -f *.csv parser*.txt mem*.txt
free -t -m / > mem.txt
grep -m2 "" < mem.txt > memo.txt
echo '<           ' | sed 's/^.*           /           /' < memo.txt > memo2.txt
tail -n +2 "memo2.txt" > "memo2.tmp" && mv "memo2.tmp" "memonovo.txt"
sed 's/.//1' memonovo.txt > parser13.txt
sed 's/.//1' parser13.txt > parser14.txt
sed 's/.//1' parser14.txt > parser15.txt
sed 's/.//1' parser15.txt > parser16.txt
sed 's/.//1' parser16.txt > parser17.txt
sed 's/.//1' parser17.txt > parser18.txt
sed 's/.//1' parser18.txt > parser19.txt
sed 's/.//1' parser19.txt > parser20.txt
sed 's/.//1' parser20.txt > parser21.txt
sed 's/.//1' parser21.txt > parser22.txt
sed 's/.//1' parser22.txt > parser23.txt
#sed 's/(;     /     ;/' < parser23.txt > parserAA.txt
cat parser23.txt | sed 's/./&;/6;s/./&;/19;s/./&;/31;s/./&;/43;s/./&;/57' > memofinal.txt
echo "total;used;free;shared;buffcache;available" >>mem.csv
echo "$(cat memofinal.txt)" >>mem.csv
chmod 777 *.csv
/usr/pgsql-10/bin/psql "dbname=postgres user=monitor" -f ${dir_sh}/import-mempsm.sql
