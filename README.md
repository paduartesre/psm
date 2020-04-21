# PSM - Proact System Monitor - Observability

This is my system of monitoring observability created in Linux with Bash, Shell, Grafana, PostgreSQL, Apache and more. Main purposes this tool behind monitors node, server, links, logs, read content file logs and insert data in the database for queries directly in Grafana.

Steps to install:

```
1- Execute script install-psm.sh
2- Execute script SQL create-db-psm.sql to create the database (Certify that credentials have configured in installation)
3- Configure scripts and paths to organize performing theirs.
4- Configure credentials to access to get files with data resulting from scripts.
5- Configure credentials to access the database in scripts to insert data in DB.
6- Crontab configuration of scripts that need to perform to get data and input data in DB.

```
