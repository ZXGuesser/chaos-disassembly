@echo off
rmdir /s /q chaos
mkdir chaos\images
copy logo.png chaos\images
skool2html.py -a -C chaos.skool