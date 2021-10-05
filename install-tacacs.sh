#!/bin/sh

echo ' Will install Tacacs and it dependecies'

wait 3

echo 'Install dependecies, gcc make libpcre3-dev libbind-dev libpam0g-dev libssl-dev'

apt-get install gcc make libpcre3-dev libbind-dev libpam0g-dev libssl-dev

echo 'Download Tacacs'

wget https://www.pro-bono-publico.de/projects/src/DEVEL.202109260929.tar.bz2
