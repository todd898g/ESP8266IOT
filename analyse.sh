#!/bin/sh

dt=`date +'%Y%d%H%M%S'`
#201617160353
hh=`date +'%H'`
mm=`date +'%M'`
#if [  $mm -lt 50 ] && [ $hh -eq 23 ]
#if [  $mm -lt 50 && $hh -eq 23 ]
#if (( mm >= 50 && hh == 23 ))
#then
#pkill mosquitto_sub
#fi
while  [ $hh -le 23 ]

do
if test `find "/home/pi/tmp/espOut.log" -mmin +5`
then
        echo "file not updating for more than 5 mins at $dt" | mail -s "file not updating
 for more than 5 mins at $dt!" yourgmailaccount@gmail.com
else

{
        n1=$((`tail -60 /home/pi/tmp/espOut.log | grep 'DOOR OPEN' | wc -l`))
        n2=$((`tail -60 /home/pi/tmp/espOut.log | grep 'OUT OF RANGE' | wc -l`))
        echo $n1, $n2
        if [ $n1 -gt 58 ]
        then
        echo "DOOR OPEN more than 5 min " | mail -s "door open for more than 5 mins!" yourgmail@gmail.com

        elif [ $n2 -gt 58 ]
        then
        echo "DOOR sensor may having issue" | mail -s "Door senser may have issues" yourgmail@gmail.com
        fi
}
fi
if [ $mm -lt 50 ] && [ $hh -eq 8 ]
then
echo "analysis is running  at $dt" | mail -s "Analysis is running at $dt!" yourgmailaccount@gmail
.com
fi
sleep 300
done
