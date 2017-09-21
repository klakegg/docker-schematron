@echo off
cd %0\..\..

java -classpath .;lib/* net.klakegg.docker.schematron.Main %*