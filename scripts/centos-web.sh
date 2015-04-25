#!/bin/bash

# Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on

# stop the service so we can add a sym link
service httpd stop

# remove the default html folder and add a sym link to the shared vagrant folder on the guest
rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

# PHP
yum install -y php php-cli php-common php-devel php-mysql

# Download starter content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/syllie/vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/syllie/vagrant/master/files/info.php

# restart apache
service httpd restart

