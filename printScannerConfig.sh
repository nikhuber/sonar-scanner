#!/bin/sh

echo "##### Sonar-Scanner Version:"
sonar-scanner -v

echo "##### Sonar-Scanner Settings:"
echo $(cat /root/sonar-scanner-3.0.3.778-linux/conf/sonar-scanner.properties)