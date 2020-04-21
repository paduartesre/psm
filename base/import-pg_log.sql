copy pg_server_logs (date_log,log_source,log_type,log_message) FROM '/var/pg_log_extract/result_pglog.csv' DELIMITER ';' CSV HEADER;
