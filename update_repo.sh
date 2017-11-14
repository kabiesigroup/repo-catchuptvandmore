#!/bin/sh

# Clear folders
rm -rf github/*
rm -rf www/jarvis/beta/plugin.video.catchuptvandmore/*
rm -rf www/jarvis/release/plugin.video.catchuptvandmore/*
rm -rf www/krypton/beta/plugin.video.catchuptvandmore/*
rm -rf www/krypton/release/plugin.video.catchuptvandmore/*

# Update Krypton master version
cd github
wget https://github.com/Catch-up-TV-and-More/plugin.video.catchuptvandmore/archive/master.zip -O master.zip
unzip -o master.zip
../create_repository.py --datadir=../www/krypton/release plugin.video.catchuptvandmore-master

# Update Jarvis master version
sed -i 's/<import addon="xbmc.python" version="2.25.0"\/>/<import addon="xbmc.python" version="2.24.0"\/>/' plugin.video.catchuptvandmore-master/addon.xml
../create_repository.py --datadir=../www/jarvis/release plugin.video.catchuptvandmore-master

# Update Krypton dev version
cd github
wget https://github.com/Catch-up-TV-and-More/plugin.video.catchuptvandmore/archive/dev.zip -O dev.zip
unzip -o dev.zip
../create_repository.py --datadir=../www/krypton/beta plugin.video.catchuptvandmore-dev

# Update Jarvis dev version
sed -i 's/<import addon="xbmc.python" version="2.25.0"\/>/<import addon="xbmc.python" version="2.24.0"\/>/' plugin.video.catchuptvandmore-dev/addon.xml
../create_repository.py --datadir=../www/jarvis/beta plugin.video.catchuptvandmore-dev






