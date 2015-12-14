#!/usr/bin/env bash

echo "------------ INSTALL PHPMYADMIN START ------------"


## Set up mysql root password

mysqladmin -u root password root

## Install php-curl
apt-get -y install php5-curl

## Create dir for phpmyadmin
mkdir -p /opt/appserver/webapps/phpmyadmin

## Download phpmyadmin with composer
cd /tmp
composer create-project phpmyadmin/phpmyadmin --repository-url=https://www.phpmyadmin.net/packages.json

## Move the files to appserver's web root
mv phpmyadmin /opt/appserver/webapps


## Set up system.
touch /opt/appserver/webapps/phpmyadmin/config.inc.php
cat > /opt/appserver/webapps/phpmyadmin/config.inc.php << 'EOF'
<?php
/*
 * Generated configuration file
 */

/* Servers configuration */
$i = 0;

/* Server: localhost [1] */
$i++;
$cfg['Servers'][$i]['verbose'] = '';
$cfg['Servers'][$i]['host'] = 'localhost';
$cfg['Servers'][$i]['port'] = '';
$cfg['Servers'][$i]['socket'] = '';
$cfg['Servers'][$i]['connect_type'] = 'tcp';
$cfg['Servers'][$i]['auth_type'] = 'cookie';
$cfg['Servers'][$i]['user'] = 'root';
$cfg['Servers'][$i]['password'] = 'root';

/* End of servers configuration */

$cfg['blowfish_secret'] = 'just-some-text-to-make-the-secret';
$cfg['DefaultLang'] = 'en';
$cfg['ServerDefault'] = 1;
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
?>
EOF

echo "------------ INSTALL PHPMYADMIN END ------------"