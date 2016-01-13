#!/bin/sh
echo "---- Setting up SIP Filesystem Storage ------------------------------------------------"

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

# Create archivematica user
useradd -m -s /bin/bash archivematica
echo archivematica:archivematica | chpasswd

# create storage directory
mkdir /assets
mkdir /assets/sip_storage

# set permissions
chown -R archivematica /assets


