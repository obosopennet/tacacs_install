#!/bin/sh

devfile=DEVEL.202109260929.tar.bz2

echo "#######################################"
echo ' Will install Tacacs and it dependecies'
echo "#######################################"

wait 3

echo "##############################################################################"
echo 'Install dependecies, gcc make libpcre3-dev libbind-dev libpam0g-dev libssl-dev'
echo "##############################################################################"


apt-get install gcc make libpcre3-dev libbind-dev libpam0g-dev libssl-dev

echo "#############################################################################"
echo 'Download Tacacs'
echo '#############################################################################'

wget https://www.pro-bono-publico.de/projects/src/$devfile


echo "#############################################################################"
echo 'Untar' $devfile
echo '#############################################################################'

tar xjvf $devfile
