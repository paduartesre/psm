#!/bin/bash

script=/var/base
basedir=/var/replica_server

sshpass -p 'your-password' scp -P <port> your-user@ip-server:/var/replica_server.tar $basedir

chmod 777 $basedir/replica_server.tar
tar -xvf $basedir/replica_server.tar -C $basedir
chmod 777 $basedir/*.csv

sleep 2

/usr/pgsql-10/bin/psql "dbname=postgres user=monitor" -f $script/import-replicaserver.sql

sleep 2

sshpass -p 'your-password' scp -P <port> your-user@ip-server "rm -f /var/replica_server.tar"
sleep 10
rm -f $basedir/*.csv
rm -f $basedir/replica_server.tar

exit

