#!/bin/bash

script=/var/scripts/base

basedir=/var/pg_log_extract

sshpass -p 'your-password' scp -P <port> your-user@ip-server:/var/files/pg_log_extract/result_pglog.csv $basedir
chmod 777 $basedir/result_pglog.csv

sleep 2

/usr/pgsql-10/bin/psql "dbname=postgres user=monitor" -f $script/import-pg_log.sql

sleep 2

sshpass -p 'your-password' scp -P <port> your-user@ip-server "rm -f /var/files/pg_log_extract/result_pglog.csv"
sleep 2
rm -f $basedir/*.csv

exit


