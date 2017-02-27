#!/bin/sh
# echo 'ok' >> /home/jdegreef/ok
#    -time 15 -locker "i3lock -d -c 000070" \
xautolock -detectsleep \
    -time 15 -locker "i3lock-extra.sh -s -o ~/Pictures/Apps-Computer-Lock-icon.png -b" \
    -notify 30 \
    -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'"
