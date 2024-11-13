adb root
adb remount
adb shell setprop persist.traced.enable 1
adb push perfetto.pbtxt /data/local/tmp/perfetto.pbtxt
adb shell "rm -rf /data/misc/perfetto-traces/trace"
adb shell "cat /data/local/tmp/perfetto.pbtxt | perfetto --txt -c - -o /data/misc/perfetto-traces/trace"

pause

