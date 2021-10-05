#!/bin/sh

devfile=DEVEL.202109260929.tar.bz2
configure=./configure tac_plus mavis --with-pam=/usr/include/security --with-ssl --with-pcre --with-lwres --with-sctp

echo "#######################################"
echo ' Will install Tacacs and it dependecies'
echo "#######################################"

wait 10

echo "##############################################################################"
echo 'Install dependecies, gcc make libpcre3-dev libbind-dev libpam0g-dev libssl-dev'
echo "##############################################################################"

sleep 10

apt-get install gcc make libpcre3-dev libbind-dev libpam0g-dev libssl-dev

echo "#############################################################################"
echo 'Download Tacacs'
echo '#############################################################################'

sleep 10

wget https://www.pro-bono-publico.de/projects/src/$devfile


echo "#############################################################################"
echo 'Untar' $devfile
echo '#############################################################################'

sleep 20

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

