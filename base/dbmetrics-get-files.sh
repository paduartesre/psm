#!/bin/bash

script=/var/base

basedir=/var/database_metrics

sshpass -p 'userpass' scp -P port user@server-ip:/var/base/database_metrics.tar $basedir
chmod 777 $basedir/database_metrics.tar
tar -xvf $basedir/database_metrics.tar -C $basedir

chmod 777 $basedir/*.csv
sleep 2
/usr/pgsql-10/bin/psql "dbname=postgres user=psm" -f $script/import-dbmetrics.sql

sleep 2
sshpass -p 'userpass' scp -P port user@server-ip: "rm -f /var/base/database_metrics.tar"
sleep 10

rm -f $basedir/*.csv

rm -f $basedir/database_metrics.tar

exit

