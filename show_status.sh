#!/bin/sh

test_process=$(ps aux | grep "[f]ilebrowser")
if [ -n "$test_process" ]
then
    result="File Browser is Running.....  "
else
    result="File Browser is not running.   "
fi
eips 22 1 "$result"
exit 0
