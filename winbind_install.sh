#!/bin/bash
#
ln -s /usr/local/samba/lib/libnss_winbind.so.2 /lib64/libnss_winbind.so
ln -s /lib64/libnss_winbind.so /lib64/libnss_winbind.so.2
