#!/bin/bash
#
# Script-Name : pre_install_opsi.sh
# Version     : 0.0.1
# Autor       : Tobias Kern
# Datum       : 25-06-2014
# Lizenz      : GPLv3
# Depends     : curl, 
# Use         : execute it
#
# Description:
# Source:
#
####################################################################################################
## Notise: no tested
##
####################################################################################################
#

# 
if [ `id -u` != 0 ]; then
    echo "Please login as ROOT user to execute your script : $@!"
    sleep 2
    exit 1
fi

cat > << EOF /etc/apt/sources.list.d/opsi-configed.list
#
deb http://download.opensuse.org/repositories/home:/uibmz:/opsi:/opsi40/Debian_7.0/ /
EOF
#####

# Add apt key for opsi
KEYURL="http://download.opensuse.org/repositories/home:/uibmz:/opsi:/opsi40/Debian_7.0/Release.key"

curl $KEYURL | apt-key add -

exit 0
