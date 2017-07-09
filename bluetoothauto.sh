#!/bin/bash

echo "Scanning for available bluetooth signals"

sudo hcitool scan>scandevices.txt

cat scandevices.txt
cat scandevices.txt | egrep -o "([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})">scandevices1.txt
cat scandevices1.txt

while read  line
do
	obexftp -b $line -B 12 -U NONE -p pic.jpeg
done<scandevices1.txt


 

