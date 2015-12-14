#!/bin/bash
echo "------------ RUNNING STARTUP COMMANDS -------------"

## Make sure apache isn't started
service apache2 stop

## Start appserver
service appserver start
service appserver-php5-fpm start

echo "------------ END: RUNNING STARTUP COMMANDS ------------"
