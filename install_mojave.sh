#!/usr/bin/env bash

#Authbind compilation and install
make
sudo make install
make clean
#Configure authbind for the default osx user:
name = echo $USER 
sudo su

#Not happy with this solution:
for i in `seq 1 1023`;
do
  touch /etc/authbind/byport/$i
  chmod 500 /etc/authbind/byport/$i
  chown ${name} /etc/authbind/byport/$i
  touch /etc/authbind/byport/\!$i
  chmod 500 /etc/authbind/byport/\!$i
  chown ${name} /etc/authbind/byport/\!$i
done
