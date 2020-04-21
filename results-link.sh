#!/bin/bash
chmod 775 *.csv
/usr/pgsql-10/bin/psql "dbname=postgres user=psm" -c "copy infra_test (code) FROM '/var/infra_test/ws-infra.csv' DELIMITER ';' CSV HEADER;"
rm -Rf /var/infra_test/ws-infra.csv
exit
