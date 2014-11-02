#!/bin/bash
sudo service postgresql stop
sudo apt-get remove postgresql-9.3 -y > /dev/null
echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main 9.4" > /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update > /dev/null
sudo apt-get install -y postgresql-9.4 php5-imagick > /dev/null
sudo php5enmod imagick
sudo service php5-fpm restart
sudo sed -i 's/port = 5433/port = 5432/g' /etc/postgresql/9.4/main/postgresql.conf
sudo service postgresql restart
sudo -u postgres psql -c "CREATE DATABASE homestead"
sudo -u postgres psql -c "CREATE USER homestead WITH PASSWORD 'homestead'"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE homestead TO homestead"
sudo -u postgres psql -c "CREATE ROLE vagrant WITH SUPERUSER LOGIN"
