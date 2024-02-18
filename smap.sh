#! /bin/bash
process_name=$1
PID=$(adb shell pidof ${process_name})
adb shell "cat /proc/${PID}/smaps > /data/local/tmp/smaps.txt"
adb pull /data/local/tmp/smaps.txt $2
