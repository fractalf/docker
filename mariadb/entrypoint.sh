#!/bin/sh

# Add custom data dir to config if requested
if [ $DATA_DIR ]; then
    if ! grep -q datadir /etc/mysql/my.cnf; then
        sed -i "/^\[mysqld\]$/a datadir = $DATA_DIR" /etc/mysql/my.cnf
    fi
fi

# Disable binary log (don't need loads of mysql-bin.* files)
sed -i "s/^log-bin/#log-bin/" /etc/mysql/my.cnf
sed -i "s/^binlog_format/#binlog_format/" /etc/mysql/my.cnf

# If not done already, install system tables and set root password
DATA_DIR=${DATA_DIR:=/var/lib/mysql}
if [ ! -d $DATA_DIR/mysql ]; then
    ROOT_PASSWORD=${ROOT_PASSWORD:=Ch4ngeP4ssw0rd}
    
    mysql_install_db --user=mysql --datadir=$DATA_DIR
    mysqld_safe&
    mysqladmin --wait=30 ping
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$ROOT_PASSWORD' WITH GRANT OPTION;"
    mysql -e "DROP DATABASE IF EXISTS test;"
    mysqladmin -u root password $ROOT_PASSWORD
    mysqladmin -u root --password=$ROOT_PASSWORD shutdown

fi

exec "$@"
