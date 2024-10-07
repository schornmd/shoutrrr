#!/bin/bash

printenv > /etc/environment

cron
rsyslogd

inotifywait -m /etc/cron.d -e create,modify,delete |
while read DIRECTORY ACTION NAME; do
  if [[ "$NAME" =~ (~|\.swp|\.tmp)$ ]]; then
    continue
  fi
  
  FILE=$DIRECTORY$NAME

  chmod 644 $FILE
  chown root:root $FILE

  echo "[$ACTION $FILE] $(service cron reload)"
done