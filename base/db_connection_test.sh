#!/bin/bash

metric=$(sshpass -p 'userpass' ssh -o ConnectTimeout=30 -p <port> user@server-ip "/usr/pgsql-10/bin/psql \"host=192.192.192.192 user=userdb dbname=postgres password=passdb\" -t -c \"select 1 as x;\"")

dt_b=$(sshpass -p 'userpass' ssh -o ConnectTimeout=30 -p <port> user@server-ip "date '+%Y-%m-%d %H:%M:%S'")

if [ $metric == "1" ];
then
/usr/pgsql-10/bin/psql "dbname=postgres user=psm" -c "INSERT INTO PG_SERVER_STATUS (CLIENT, IP_ADDRESS, M_VALUE, DT_BOX, MESSAGE) VALUES ('client', '192.192.192.192', 1, '$dt_b', '$metric')"
else
/usr/pgsql-10/bin/psql "dbname=postgres user=psm" -c "INSERT INTO PG_SERVER_STATUS (CLIENT, IP_ADDRESS, M_VALUE, DT_BOX, MESSAGE) VALUES ('client', '192.192.192.192', 0, current_timestamp, '$metric')"
fi

exit
