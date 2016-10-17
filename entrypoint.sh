#!/bin/bash

echo 'Initializing laravel database'

mysqld_safe <<-EOSQL
--skip-grant-tables
EOSQL

mysql -u root <<-SQL
CREATE DATABASE IF NOT EXISTS laravel_base;
SQL

ls -la 

cd laravel5-example/ && php artisan migrate && php artisan serve --port 8000 --host 0.0.0.0
