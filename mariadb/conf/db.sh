#!/bin/sh

while [ -d /run/mysqld/mysqld.sock ];
do
    sleep 1;
done

# echo "Socket"

# if [ ! -d /var/lib/mysql/mysql ]; then
# 	mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null
# fi

# /usr/bin/mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql
# /usr/bin/mysqld --user=root --datadir=/var/lib/mysql & sleep 2

# mysql -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;"
# mysql -e "CREATE USER IF NOT EXISTS \`${MARIADB_USER}\`@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
# mysql -e "FLUSH PRIVILEGES;"

# pkill mysqld
# /usr/bin/mysqld --user=root --datadir=/var/lib/mysql


#*************************************************
# set -o errexit
# set -o nounset

# if [ ! -f /var/lib/mysql/mysql ]; then
# 	mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null

# fi

# mysqld --user=root --datadir=/var/lib/mysql --bootstrap << _EOF_
# FLUSH PRIVILEGES;
# ALTER USER 'root'@'localhost' IDENTIFIED BY '';
# CREATE DATABASE IF NOT EXISTS wordpress;
# CREATE USER IF NOT EXISTS 'wpuser'@'%' IDENTIFIED BY 'wppass';
# GRANT ALL PRIVILEGES ON wpuser.* TO 'wordpress'@'%';
# FLUSH PRIVILEGES;
# _EOF_

# exec /usr/bin/mysqld --user=mysql


#**************************************
# rc-service mariadb start 2> /dev/null
# mysql -u mysql -e "CREATE DATABASE ${WP_DATABASE_NAME};"
# mysql -u mysql -e \
# "CREATE DATABASE IF NOT EXISTS wordpress;
# CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY '12345';
# GRANT ALL PRIVILEGES ON wordpress.* TO 'user'@'%';
# FLUSH PRIVILEGES;
# ALTER USER 'root'@'localhost' IDENTIFIED BY 'root12345';
# FLUSH PRIVILEGES;"
# /usr/bin/mysqld


#**************************************
/usr/bin/mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
/usr/bin/mysqld --user=mysql --datadir=/var/lib/mysql & sleep 2

mysql -e "CREATE DATABASE IF NOT EXISTS \`wordpress\`;"
mysql -e "CREATE USER IF NOT EXISTS \`wpuser\`@'localhost' IDENTIFIED BY 'wppass';"
mysql -e "GRANT ALL PRIVILEGES ON \`wordpress\`.* TO \`wpuser\`@'%' IDENTIFIED BY 'wppass';"
mysql -e "ALTER USER 'mysql'@'localhost' IDENTIFIED BY '';"
mysql -e "FLUSH PRIVILEGES;"

pkill mysqld
# /usr/bin/mysqld --user=root --datadir=/var/lib/mysqlo