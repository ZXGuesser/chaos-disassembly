@echo off
rmdir /s /q chaos
skool2html.py -a -C chaos.skool
copy logo.png chaos\images > nul
mkdir chaos\sounds 
copy sounds chaos\sounds > nul