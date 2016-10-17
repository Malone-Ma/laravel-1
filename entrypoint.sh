#!/bin/bash

echo 'Initializing laravel database'

##Stop the mysql service
/etc/init.d/mysql stop

##Start mysql service in safe mode in background
mysqld_safe --skip-grant-tables &
sleep 10
ps aux | grep mysql 

##Create databse 
mysql -uroot <<-SQL
CREATE DATABASE IF NOT EXISTS laravel_base;
exit
SQL

##Start the laravel php application
cd laravel5-example/ && php artisan migrate && php artisan serve --port 8000 --host 0.0.0.0
