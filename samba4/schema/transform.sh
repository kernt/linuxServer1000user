#!/bin/bash
#
# Script-Name : transform.sh
# Version     : 0.01
# Autor       : Tobias Kern
# Datum       : $DATE
# Lizenz      : GPLv3
# Depends     : ldb tools, sernet-samba-ad
# Use         : 
#
# Example: 
#
# Description: Transform your ldif template for use with your saba4 ad dc.
###########################################################################################
## !!!! Backup all ldb befor you use this script!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
## 
## 
###########################################################################################
#
# to pikup up funktions with one view I useing the following sytaxes
#  __NAMEOFFUNTION __ stand for an Systemcall
#  _NAMEOFFUNKTION _ stand for an output of an simple commando
# NAMEOFFUNKTION stand for an complicated use of some commandos
# __ and _ Prevent for complications with normal Variables in your enviroment
#
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

FILEINPUT="https://wiki.samba.org/images/9/91/Automount_template.ldif.txt"
FILEOUTPUT="automount.ldif"

# somtimes bugy! dnsdomainname dont show your real ip address. Take a look manualy.
SERVERIP="$(dnsdomainname -i)"
ROOTDN="ldbsearch -H ldap://$SERVERIP -U administrator -s base dn"

# tested with debain with sernet repo.
__stopsamba () {
/etc/init.d/sernet-samba-ad
}

transform () {
local FILEOUTPUT="automount.ldif"
local ROOTDN="ldbsearch -H ldap://$SERVERIP -U administrator -s base dn"
cat automount_template.ldif | sed "local s/$ROOTDN/value_of_rootDN_obtained_in_previous_step/" > $FILEOUTPUT
}


transform
__stopsamba

echo "samba ist stoped your next turn is add the new genarated file in your ad with your ldbadd commando."

exit $EXIT_SUCCESS
