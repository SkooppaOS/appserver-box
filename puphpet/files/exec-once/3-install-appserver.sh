#!/usr/bin/env bash

echo "------------ INSTALL APPSERVER START ------------"

## Install the appserver package
echo "deb http://deb.appserver.io/ wheezy main" > /etc/apt/sources.list.d/appserver.list
wget http://deb.appserver.io/appserver.gpg -O - | apt-key add -
apt-get update
apt-get -y install appserver-dist

## Stop the service
service appserver stop


## Change the server.xml file so appserver is the main webserver

sed -i 's|<param name="port" type="integer">9080</param>|<param name="port" type="integer">80</param>|' /opt/appserver/etc/appserver/appserver.xml

## Setup environment
/opt/appserver/server.php -s dev


echo "------------ INSTALL APPSERVER END ------------"