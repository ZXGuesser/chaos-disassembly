@echo off
rmdir /s /q chaos
mkdir chaos\images
copy logo.png chaos\images\logo.png > nul
mkdir chaos\sounds 
copy sounds chaos\sounds > nul
skool2html.py -a -C chaos.skool