#!/bin/bash
cd /opt/scripts/PSM
chmod 777 *.csv
/usr/pgsql-10/bin/psql "dbname=postgres user=psm" -c "copy  (data,codigo_erro,sistema) FROM '/var/PSM/myapp.csv' DELIMITER ';' CSV HEADER;"
exit
