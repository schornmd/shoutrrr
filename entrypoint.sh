#!/bin/bash

cron
rsyslogd

inotifywait -m /etc/cron.d -e create,modify,delete |
while read DIRECTORY ACTION NAME; do
  FILE=$DIRECTORY$NAME

  chmod 644 $FILE
  chown root:root $FILE

  echo "[$ACTION $FILE] $(service cron reload)"
done