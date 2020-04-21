#!/bin/bash

script=/var/base

basedir=/var/base

sshpass -p 'user-pass' scp -P <port> user@ip-server:/var/base/filebase.tar $basedir

chmod 777 $basedir/filebase.tar
tar -xvf $basedir/filebase.tar -C $basedir
chmod 777 $basedir/*.csv

sleep 2

/usr/pgsql-10/bin/psql "dbname=postgres user=psm" -f $script/import.sql

sleep 2

sshpass -p 'user-pass' scp -P <port> user@ip-server "rm -f /var/base/filebase.tar"

sleep 10

rm -f $basedir/*.csv

rm -f $basedir/filebase.tar

exit
