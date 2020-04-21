copy psm.disk (hostname,metric,ds_path,m_value) FROM '/var/so_metrics_database/trace_disk.csv' DELIMITER ';' CSV HEADER;

copy psm.memory (hostname,metric,m_value) FROM '/var/so_metrics_database/trace_memory.csv' DELIMITER ';' CSV HEADER;

copy psm.cpu (hostname,metric,m_value) FROM '/var/so_metrics_database/trace_cpu.csv' DELIMITER ';' CSV HEADER;

