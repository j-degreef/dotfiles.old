#!/bin/sh

#if [ $(pgrep xautolock) ] ; then
#    echo yes;
#    killall xautolock ;
#fi

xautolock -exit # remove previous instance if any
xset dpmx force suspend
sleep 1
xautolock -detectsleep \
  -time 15 -locker i3_lock -notify 30 \
  -notifier "play -n synth 0.1 sin 1090 || echo -e "\a";notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'" &

