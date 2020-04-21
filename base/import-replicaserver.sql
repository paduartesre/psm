copy psm.pg_replica_server (is_inrecovery,wal_receive,wal_replay) FROM '/var/replica_server/replica_server.csv' DELIMITER ';' CSV HEADER;
