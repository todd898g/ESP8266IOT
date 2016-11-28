#!/bin/sh
dt=`date +'%Y%d%H%M%S'`
#201617160353
hh=`date +'%H'`
mm=`date +'%M'`


find /home/pi/tmp -name 'espOut.log*' -mtime +7 -exec rm {} \;

if [ -e "/home/pi/tmp/espOut.log" ]
then
  cp -p /home/pi/tmp/espOut.log /home/pi/tmp/espOut.log_$dt
fi

date > /home/pi/tmp/espOut.log

mosquitto_sub -h 127.0.0.1 -p 1888 -i testSub -t ledStatusOut >> /home/pi/tmp/es
pOut.log