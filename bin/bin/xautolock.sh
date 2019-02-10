#!/bin/sh

#if [[ ! $(pgrep -x xautolock) ]] ; then
echo "Starting xautolock..."
#pkill xautolock
#sleep 3
xautolock -detectsleep \
    -time 10 -locker i3_lock -notify 30 \
    -notifier "play -n synth 0.1 sin 1090 || echo -e "\a";notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'" &
#fi

