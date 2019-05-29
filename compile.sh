#!/bin/bash

if [ ! -f deb_package/usr/bin/flashplayer ]; then
	wget "https://fpdownload.macromedia.com/pub/flashplayer/updaters/32/flash_player_sa_linux.x86_64.tar.gz" -O flash_sa_x64.tar.gz
	tar -xzf flash_sa_x64.tar.gz
	rm -rf deb_package/usr/share/doc/
	rm -rf deb_package/usr/bin/
	mkdir -p deb_package/usr/bin/
	mkdir -p deb_package/usr/share/doc/flashplayer-sa-projector/
	mv -f flashplayer deb_package/usr/bin/
	mv -f LGPL/ deb_package/usr/share/doc/flashplayer-sa-projector/
	mv -f license.pdf deb_package/usr/share/doc/flashplayer-sa-projector/
fi

dpkg-deb -b deb_package .