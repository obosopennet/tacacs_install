#!/bin/sh

devfile=DEVEL.202109260929.tar.bz2
configure=./configure tac_plus mavis --with-pam=/usr/include/security --with-ssl --with-pcre --with-lwres --with-sctp

echo "#######################################"
echo ' Will install Tacacs and it dependecies'
echo "#######################################"


echo "##############################################################################"
echo "Run update and upgrade"
echo "##############################################################################"
sudo apt-get update && sudo apt-get upgrade -y

sleep 5

echo "##############################################################################"
echo "Install this package:
perl 
build-essential 
libnet-ldap-perl 
libnet-ssleay-perl 
libauthen-pam-perl 
libpam-runtime 
libio-pty-perl 
libbind-dev 
libssl-dev 
libpcre3-dev 
libpcre++-dev 
libfreeradius-dev 
zlib1g-dev 
libgcrypt20-dev 
libcurl4-openssl-dev 
libpam0g-dev 
ibsctp-dev 
libevent-dev
"
echo "##############################################################################"

sudo apt-get install -y perl build-essential libnet-ldap-perl libnet-ssleay-perl libauthen-pam-perl libpam-runtime libio-pty-perl libbind-dev libssl-dev libpcre3-dev libpcre++-dev libfreeradius-dev zlib1g-dev libgcrypt20-dev libcurl4-openssl-dev libpam0g-dev libsctp-dev libevent-dev

#echo "##############################################################################"
#echo 'Install dependecies, gcc make libpcre3-dev libbind-dev libpam0g-dev libssl-dev'
#echo "##############################################################################"

sleep 10

#apt-get install gcc make libpcre3-dev libbind-dev libpam0g-dev libssl-dev

echo "#############################################################################"
echo 'Go to home directory'
echo '#############################################################################'

cd ~

sleep 5

echo "#############################################################################"
echo 'Download Tacacs'
echo '#############################################################################'

sleep 5

wget https://www.pro-bono-publico.de/projects/src/$devfile


echo "#############################################################################"
echo 'Untar' $devfile
echo '#############################################################################'

sleep 5

tar xjvf $devfile

sleep 5

cd PROJECTS

echo "#############################################################################"
echo "Welcome to PROJECTS folder"
echo '#############################################################################'

sleep 5

echo "#############################################################################"
echo "Don't know why this is needed, ln -s /usr/include/security ./pam"
echo '#############################################################################'

ln -s /usr/include/security ./pam


echo "#############################################################################"
echo "Run ./Configure with parameters"
echo '#############################################################################'

$configure

sleep 5

echo "#############################################################################"
echo "Run make"
echo '#############################################################################'

sleep 5

make

echo "#############################################################################"
echo "Run make-install"
echo '#############################################################################'

sleep 5

make install


echo "#############################################################################"
echo "Create log folders
/var/log/tac_plus
/var/log/tac_plus/access
/var/log/tac_plus/accounting
/var/log/tac_plus/authentication
#############################################################################"
sleep 10

mkdir /var/log/tac_plus
mkdir /var/log/tac_plus/access
mkdir /var/log/tac_plus/accounting
mkdir /var/log/tac_plus/authentication

sleep 5

stat --format '%a' /var/log/tac_plus

/usr/local/lib/mavis/mavis_tacplus_ldap.pl < /dev/null

sleep 10

echo "#############################################################################"
echo "Copy tac_plus configuration file."
echo '#############################################################################'

cp ~/tacacs_install/tac_plus.cfg /usr/local/etc/
chmod 755 tac_plus.cfg /usr/local/etc/tac_plus.cfg


sleep 5

echo "#############################################################################"
echo "Create a service daemon for tac_plus."
echo '#############################################################################'

cd /etc/init.d
cp ~/PROJECTS/tac_plus/extra/etc_init.d_tac_plus /etc/init.d/tac_plus
chmod 755 /etc/init.d/tac_plus
chown root:root /etc/init.d/tac_plus
update-rc.d tac_plus defaults
service tac_plus start

