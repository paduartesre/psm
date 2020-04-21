#!/bin/bash

script=/var/base

basedir=/var/so_metrics_database

sshpass -p 'your_password' scp -P port your-user@ip-server:/var/base/so_metrics.tar $basedir

chmod 777 $basedir/so_metrics.tar

tar -xvf $basedir/so_metrics.tar -C $basedir

chmod 777 $basedir/*.csv

sleep 2

/usr/pgsql-10/bin/psql "dbname=postgres user=psm" -f $script/import-so_metrics.sql

sleep 2

sshpass -p 'your_password' scp -P port your-user@ip-server "rm -f /var/base/so_metrics.tar"

sleep 10

rm -f $basedir/*.csv

rm -f $basedir/so_metrics.tar

exit
