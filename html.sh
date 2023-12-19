#!/bin/sh
rm -rf chaos
mkdir chaos
mkdir chaos/images
cp logo.png chaos/images/logo.png 
mkdir chaos/sounds 
cp -r sounds chaos
skool2html.py -a -C chaos.skool
