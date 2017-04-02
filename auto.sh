#!/bin/sh
if [ -x vsftpd-3.0.3 ]
then
    echo "unzip is done"
else
    echo  "unzip..."
    tar xvzf vsftpd-3.0.3.tar.gz
fi 
cp Makefile vsftpd-3.0.3/
cp vsftpd.conf /etc
cd vsftpd-3.0.3
#make clean 
if [ -x /usr/local/man/man5 ]
then
    echo "man5 ok"
else
    echo "creat man5"
    mkdir /usr/local/man/man5
fi

if [ -x /usr/local/man/man8 ]
then
    echo "man8 ok"
else
    echo "creat man8"
    mkdir /usr/local/man/man8
fi

make && make install
if [ ! -x /usr/share/empty ]
then
    mkdir /usr/share/empty
fi

if [ ! -x /var/ftp ]
then
    mkdir /var/ftp
fi

useradd -d /var/ftp ftp
chown root.root /var/ftp
chmod og-w /var/ftp

