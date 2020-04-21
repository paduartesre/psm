
copy psm.pg_connections (metric, m_value) FROM '/var/database_metrics/connections.csv' DELIMITER ';' CSV HEADER;

copy psm.pg_schema_size (metric, m_value) FROM '/var/database_metrics/schema_size.csv' DELIMITER ';' CSV HEADER;

copy psm.pg_largest_tables (m_value, metric) FROM '/var/database_metrics/largest_tables.csv' DELIMITER ';' CSV HEADER;

copy psm.pg_top_tables (metric, m_value) FROM '/var/database_metrics/top_tables.csv' DELIMITER ';' CSV HEADER;

copy psm.pg_replication (pid, client_addr, state, sync_state, wal_lsn, write_lag, flush_lag, replay_lag) FROM '/var/database_metrics/replication.csv' DELIMITER ';' CSV HEADER;

