#! /bin/sh

export APKOUT=/home/packager/packages/root/aports

sudo chown -Rf packager:packager /root/aports
rm -Rf /root/aports/$1
cp -Rfv $1 /root/aports
sudo chown -Rf packager:packager /root/aports/$1

cd /root/aports/$1 && \
    sudo -u packager abuild checksum && \
    sudo -u packager abuild verify && \
    sudo -u packager abuild fetch && \
    sudo -u packager abuild unpack && \
    sudo -u packager abuild deps && \
    PATH=/root/aports/$1/pkg/$1/usr/bin:$PATH sudo -u packager abuild -c -R -P -v

cd $APKOUT/$(abuild -A)/ && \
    apk index -o APKINDEX.tar.gz *.apk && \
    abuild-sign APKINDEX.tar.gz

sudo chown -Rf packager:packager $APKOUT/$(abuild -A)/
cp -Rfv $APKOUT/* /target/
