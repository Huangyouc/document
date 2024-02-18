#!/bin/bash
vin='T1EPHEVTEST000121'
vinLen=${#vin}

$(> temp)
for (( i = 0; i < vinLen; i++ ));
do
  echo -n 0x >> temp
  echo -n ${vin:$i:1} | od -An -t x1 | tr -d "\n\t  " >> temp
done
realVin=$(cat -A temp)
rm temp

echo -e "$realVin\n"
adb shell msg_center_test -t uartrpc_svc/uds/req "~!b:0x030x010x000x0f0x010x0e0x800x2e0xf10x90$realVin"
sleep 0.5


carSn='FYOS2212050602049702564992349645'

snLen=${#carSn}
$(> temp)
for (( i = 0; i < snLen; i++ ));
do
  echo -n 0x >> temp
  echo -n ${carSn:$i:1} | od -An -t x1 | tr -d "\n\t  " >> temp
done
realCarSn=$(cat -A temp)
rm temp

adb shell msg_center_test -t uartrpc_svc/uds/req "~!b:0x030x010x000x0f0x010x0e0x800x2e0xF10x8c$realCarSn"

echo "请5秒后重启"