#!/bin/sh
echo "---- Installing MySQL and DBs ------------------------------------------------"

#### GET ENVARS #################################################
SHARED_DIR=$1

if [ -f "$SHARED_DIR/config/envvars" ]; then
  . $SHARED_DIR/config/envvars
  printf "found your local envvars file. Using it."

else
  . $SHARED_DIR/config/envvars.default
  printf "found your default envvars file. Using its default values."

fi
#################################################################


echo "mysql-server mysql-server/root_password password $SQL_PASSWORD" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $SQL_PASSWORD" | debconf-set-selections
apt-get -y install mysql-server-5.5