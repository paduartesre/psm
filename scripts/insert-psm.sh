#!/bin/bash
cd /opt/scripts/PSM
chmod 777 *.csv
/usr/pgsql-10/bin/psql "dbname=postgres user=monitor" -c "copy  (data,codigo_erro,sistema) FROM '/opt/scripts/PSM/ws-iss.csv' DELIMITER ';' CSV HEADER;"
exit
