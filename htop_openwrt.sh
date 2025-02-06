#!/bin/sh

connection_count=$(wc -l < /proc/net/nf_conntrack)

logread_output=$(logread)

debug_count=$(echo "$logread_output" | grep "debug" | wc -l)
warn_count=$(echo "$logread_output" | grep "warn" | wc -l)
err_count=$(echo "$logread_output" | grep "err" | wc -l)
crit_count=$(echo "$logread_output" | grep "crit" | wc -l)
alert_count=$(echo "$logread_output" | grep "alert" | wc -l)
emerg_count=$(echo "$logread_output" | grep "emerg" | wc -l)
err_msgs=$(expr $err_count + $warn_count + $debug_count + $emerg_count + $alert_count + $crit_count)

info_count=$(echo "$logread_output" | grep "info" | wc -l)
notice_count=$(echo "$logread_output" | grep "notice" | wc -l)
info_msgs=$(expr $info_count + $notice_count)

echo "connections : $connection_count"
echo "error : $err_msgs"
echo "informations : $info_msgs"


echo "choose one :"
echo "1 - connections "
echo "2 - system error "
echo "3 - system informations"
read choice

case "$choice" in
  1)
    cat /proc/net/nf_conntrack
    ;;
  2)
    echo "$logread_output" | grep "warn\|debug\|err\|crit\|alert\|emerg"
    ;;
  3)
    echo "$logread_output" | grep "info\|notice"
    ;;
  *)
    echo "invaild"
    ;;
esac

