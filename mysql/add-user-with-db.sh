#!/bin/bash

echo "user name:"
read USER_NAME

echo "user password:"
read -s USER_PASSWORD

echo "root password:"
read -s ROOT_PASSWORD

mysql -uroot -p$ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $USER_NAME CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci"
mysql -uroot -p$ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS $USER_NAME@localhost IDENTIFIED BY '$USER_PASSWORD'"
mysql -uroot -p$ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $USER_NAME.* TO '$USER_NAME'@'localhost'"

echo "all done"
