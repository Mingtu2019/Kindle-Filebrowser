#!/bin/sh
ps -ef | grep start.sh | grep -v grep | awk '{print $2}' | xargs kill
ps -ef | grep start_auth.sh | grep -v grep | awk '{print $2}' | xargs kill

killall filebrowser

lipc-set-prop -i com.lab126.powerd preventScreenSaver 0

sleep 1
eips 25 1 "                  "

exit 0