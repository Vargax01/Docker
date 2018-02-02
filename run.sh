#!/bin/bash

DOCUMENTROOT=${DOCUMENTROOT:-""}
SERVER_NAME=${SERVER_NAME:-""}
sed -i 's/root \/var\/www\/html/root '$DOCUMENTROOT'/g' /etc/nginx/sites-available/default
sed -i 's/server_name _/server_name '$SERVER_NAME'/g' /etc/nginx/sites-available/default
DOCUMENTROOT=`echo $DOCUMENTROOT | tr '\' ' ' | sed -r 's/ //g'`
mv /index.html $DOCUMENTROOT

nginx -g 'daemon off;'
