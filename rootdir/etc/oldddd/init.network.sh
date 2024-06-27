#!/system/bin/sh

for file in /proc/sys/net/ipv6/conf/rmnet*
do
  echo 0 > $file/accept_ra_defrtr
done

