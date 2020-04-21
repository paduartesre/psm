copy psm.data_amount (data1, m_value) FROM '/var/base/file-data.csv' DELIMITER ';' CSV HEADER;

copy psm.data_latest (dt_session, _status, cpp_return, cd_reason) FROM '/var/base/data_transmited_app.csv' DELIMITER ';' CSV HEADER;

copy psm.transactions_amount (data1, m_value) FROM '/var/base/file-data-b.csv' DELIMITER ';' CSV HEADER;

copy psm.transactions_latest (data_log,message,return_code,ds_extended_error) FROM '/var/base/transactions_latest.csv' DELIMITER ';' CSV HEADER;

copy psm.data_amount_by_hour (_status, data1, m_value) FROM '/var/base/file-data_by_hour.csv' DELIMITER ';' CSV HEADER;

copy psm.verify-status-app (app,id_record,app_status,dt_trans,elapsed_time) FROM '/var/base/verify-status-app.csv' DELIMITER ';' CSV HEADER;

copy psm.verify-status-app_amount (data1,m_value) FROM '/var/base/verify-status-app_amount.csv' DELIMITER ';' CSV HEADER;

