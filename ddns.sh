#!/bin/bash
local_ip=$(ip addr | awk '/^[0-9]+: / {}; /inet.*global.*eth/ {print gensub(/(.*)\/(.*)/, "\\1", "g", $2)}')
ipv6=$(ip addr show|grep -v deprecated|grep -A1 'inet6 [^f:]'|grep -v ^--|sed -nr ':a;N;s#^ +inet6 ([a-f0-9:]+)/.+? scope global .*? valid_lft ([0-9]+sec) .*#\2 \1#p;Ta'|sort -n|head -n1|cut -d' ' -f2)

curl  "http://freedns.afraid.org/dynamic/update.php?xxxxx&address=${ipv6}"

curl "http://freedns.afraid.org/dynamic/update.php?xxxx"

curl  "http://freedns.afraid.org/dynamic/update.php?xxxxx&address=${local_ip}"
