#!/bin/bash

#Install pre-requisites
yum -y update
yum -y install vim gcc wget httpd fontconfig freetype* urw-fonts
systemctl start httpd
systemctl enable httpd

#Install PostgreSQL
rpm -Uvh https://yum.postgresql.org/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm
yum -y install postgresql10-server postgresql10
/usr/pgsql-10/bin/postgresql-10-setup initdb
systemctl start postgresql-10.service
systemctl enable postgresql-10.service

#Install Grafana
wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-5.2.2-1.x86_64.rpm
sudo yum -y localinstall grafana-5.2.2-1.x86_64.rpm
systemctl start grafana-server
systemctl status grafana-server
sudo systemctl enable grafana-server.service
systemctl daemon-reload

#Configure Firewall
firewall-cmd --get-zones
firewall-cmd --get-active-zones
sudo firewall-cmd --zone=public --add-service=http
sudo firewall-cmd --zone=public --add-service=https
sudo firewall-cmd --zone=public --permanent --add-service=http
sudo firewall-cmd --zone=public --permanent --add-service=https
sudo firewall-cmd --zone=public --add-port=3000/tcp
sudo firewall-cmd --zone=public --add-port=80/tcp
sudo firewall-cmd --zone=public --add-port=5432/tcp
sudo firewall-cmd --reload
