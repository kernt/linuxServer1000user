#!/bin/bash
#
# Script-Name : $@.sh
# Version : 0.01
# Autor : Tobias Kern
# Datum : $DATE
# Lizenz : GPLv3
# Depends :
# Use :
#
# Example:
#
# Description:
#########################################################################################################
## Tested on Virtualbox with Debian 7.4
##
#########################################################################################################
# Name of your script.
SCRIPTNAME=$(basename $0.sh)
# exit code without any error
EXIT_SUCCESS=0
# exit code I/O failure
EXIT_FAILURE=1
# exit code error if known
EXIT_ERROR=2
# unknown ERROR
EXIT_BUG=10



FQDNAME="getent hosts $(hostname -f)"

echo "Your FQDN is $FQDNAME"

echo "install  Opsi and depends"
sleep 2
apt-get install aptitude get lsof host python-mechanize p7zip-full cabextract openbsd-inetd echo smbnetfs 
aptitude update
aptitude safe-upgrade 
aptitude remove tftpd 
update-inetd --remove tftpd
aptitude install opsi-atftpd
aptitude install opsi-depotserver
aptitude install opsi-configed

echo "Mysql installation working"
sleep 2
apt-get -y mysql-server


echo " now will opsi configure mysql backend  give the Data and wirte it down on your favorite place"
opsi-setup --configure-mysql

