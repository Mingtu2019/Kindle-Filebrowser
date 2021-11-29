#!/bin/sh
iptables -I INPUT -p tcp --dport 80 -j ACCEPT

:<<EOF
# enable wireless if it is currently off
WIFI_IS_OFF=1
if [ 0 -eq `lipc-get-prop com.lab126.cmd wirelessEnable` ]; then
	eips 30 3 "WiFi is off, turning it on now"
	lipc-set-prop com.lab126.cmd wirelessEnable 1
	WIFI_IS_OFF=0
fi
EOF

# enable wireless if it is currently off
if [ 0 -eq `lipc-get-prop com.lab126.cmd wirelessEnable` ]; then
	lipc-set-prop com.lab126.cmd wirelessEnable 1
fi

eips 25 1 "                  "

# start filebrowser in the background
if [ "$(ps aux | grep '[f]ilebrowser')" ];then killall filebrowser;fi

if [ -f ./filebrowser.db ]
then
    METHOD=$(./filebrowser config cat | grep 'Auth method' | awk '{print $3}')
    if [ 'json' != "$METHOD" ]
    then
        ./filebrowser config set --auth.method=json > /dev/null
    fi
fi &
./filebrowser -a 0.0.0.0 -p 80 -r /mnt/us > /dev/null &

# refresh IP display in the background
while [ 1 -eq `lipc-get-prop com.lab126.cmd wirelessEnable` ] && [ "$(ps aux | grep '[f]ilebrowser')" ]; do
    eips 25 1 "=`ifconfig wlan0 | grep 'inet addr' | awk -F '[ :]' '{print $13}'`="
    sleep 5
done > /dev/null &

sleep 60

#保持屏幕常亮，如果网络连接并且filebrowser运行，则开启屏幕常量，否则关闭屏幕常亮关闭wifi关闭filebrowser并退出
while :; do
if [ 1 -eq `lipc-get-prop com.lab126.cmd wirelessEnable` ] && [ "$(ps aux | grep '[f]ilebrowser')" ]
then
    lipc-set-prop -i com.lab126.powerd preventScreenSaver 1
else
    eips 25 1 "                  "
    lipc-set-prop -i com.lab126.powerd preventScreenSaver 0
    lipc-set-prop com.lab126.cmd wirelessEnable 0
    killall filebrowser
    exit 0
fi 
done > /dev/null &

:<<EOF
# refresh IP display in the background
#while :; do
while(( $WIFI_IS_OFF=0 )); do
    eips 30 1 "=`ifconfig wlan0 | grep 'inet addr' | awk -F '[ :]' '{print $13}'`="
    sleep 5
done > /dev/null &

# waiting for powerButtonPressed
lipc-set-prop -i com.lab126.powerd preventScreenSaver 1
lipc-wait-event  com.lab126.hal powerButtonPressed | read event #it's blocking
lipc-set-prop -i com.lab126.powerd preventScreenSaver 0
kill $(jobs -p)
eips 30 3 "File Browser is turned off.   "

# Restore WiFi status
if [ 0 -eq $WIFI_IS_OFF ]; then
	lipc-set-prop com.lab126.cmd wirelessEnable 0
	sleep 0.5
	eips 30 3 "Turning off WiFi              "
fi

# Clear screen
sleep 1
eips 30 1 "                     "
eips 30 3 "                              "
EOF