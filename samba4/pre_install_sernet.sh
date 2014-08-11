#!/bin/bash
#
# Script-Name : pre_install_sernet.sh
# Version     : 0.01
# Autor       : Tobias Kern
# Datum       : 25-06-2014
# Lizenz      : GPLv3
# Depends     : 
# Use         :
#
# Example:
#
# Description:
###########################################################################################
## 
##
###########################################################################################
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

if [ `id -u` != 0 ]; then
    echo "Please login as ROOT user to execute your script : $@!"
    sleep 2
    exit 1
fi

# Variable for optionsswitch
#OPTFILE=""
#fbname=$(basename "$1".txt)

# simple help funktion
#function usage {
# echo "Usage: $SCRIPTNAME [-h] [-v] [-o arg] file ..." >&2
# [[ $# -eq 1 ]] && exit $1 || exit $EXIT_FAILURE
#}
####################################################################################################
#
#
####################################################################################################

# some varibles

SERNETUSER=READEDSERNETUSER
SERNETACCESSKEY=READEDSERNETACCESSKEY

## Pre depends install for Sernet sources
[ -e /usr/lib/apt/methods/https ] || {
  apt-get update
  apt-get --yes install apt-transport-https
}

#####
# test whether variables woks with next lines
# if does not worked alternative use funktion createsernetsourceslist
##

##Samba Sernet Quellen zu apt hinzufügen.
##Samba Sernet add apt sources.
cat > << EOF /etc/apt/sources.list.d/samba4-sernet.list
# SerNet Samba 4.1 Packages
#
# (debian-wheezy)
#
deb https://$SERNETUSER:PASSWORT@download.sernet.de/packages/samba/4.1/debian wheezy main
deb-src https://$SERNETUSER:PASSWORT@download.sernet.de/packages/samba/4.1/debian wheezy main
EOF
#####


#Sernet-Key:
wget http://ftp.sernet.de/pub/sernet-samba-keyring_1.4_all.deb


# Doc 
# http://chris-blog.net/2014/01/samba-4-als-domain-controller-unter-debian-wheezy-installieren/
# http://linux-on-a-server.com/samba-4-active-directory-my-first-successfully-test/
