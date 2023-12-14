#!/bin/bash
local_ip=$(ip addr | awk '/^[0-9]+: / {}; /inet.*global.*eth/ {print gensub(/(.*)\/(.*)/, "\\1", "g", $2)}')
ipv6=$(ip addr show|grep -v deprecated|grep -A1 'inet6 [^f:]'|grep -v ^--|sed -nr ':a;N;s#^ +inet6 ([a-f0-9:]+)/.+? scope global .*? valid_lft ([0-9]+sec) .*#\2 \1#p;Ta'|sort -n|head -n1|cut -d' ' -f2)
# IPV6.64661181.XYZ
curl  "http://freedns.afraid.org/dynamic/update.php?aDNGaHVyZnNaalNiZlVmWVp4cFlWTXM0OjIwOTg3NTk3&address=${ipv6}"
#ipv4.64661181.xyz
curl "http://freedns.afraid.org/dynamic/update.php?aDNGaHVyZnNaalNiZlVmWVp4cFlWTXM0OjIxMDE1NjYw"
# 64661181.XYZ
curl  "http://freedns.afraid.org/dynamic/update.php?aDNGaHVyZnNaalNiZlVmWVp4cFlWTXM0OjIxMDE1NTc3&address=${local_ip}"
