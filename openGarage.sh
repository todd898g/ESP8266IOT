#!/bin/sh

dt=`date +'%Y_%m_%d_%H_%M_%S'`
#201617160353
yy=`date +'%Y'`
mn=`date +'%m'`
hh=`date +'%H'`
mm=`date +'%M'`
msg="zhimakaimen!"
mosquitto_pub -p 1888  -t ledStatus -m "{dt:$dt,msg:$msg}"
