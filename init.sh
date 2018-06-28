#!/bin/sh
cp /config.yml.default /config.yml
SERVERS="$(env|grep 'SERVERS='|cut -d "=" -f2 | sed 's/,/\n/g')"

echo "  servers:" >> /config.yml
for server in $SERVERS; do
	  echo "    - $server:1" >> /config.yml
done
nutcracker -c /config.yml -s 22222 -a 0.0.0.0
