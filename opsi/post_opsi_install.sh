
#only if you use sernet repository
ln -s /etc/init.d/sernet-samba-ad /etc/init.d/samba

# add some users for opsi

useradd -m -s /bin/bash adminuser
passwd adminuser
smbpasswd -a adminuser
usermod -aG opsiadmin adminuser
getent group opsiadmin
usermod -aG pcpatch adminuser
grep pcpatch /etc/group
opsi-setup --patch-sudoers-file



echo "Install isc DHCP Server"
sleep 2
aptitude install isc-dhcp-server

echo "Configure DHCP Server"

opsi-setup --auto-configure-dhcpd

