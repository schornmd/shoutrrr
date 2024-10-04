FROM golang:1.23.2

RUN apt update && apt install -y rsyslog cron inotify-tools sqlite3
RUN mkdir -p /etc/cron.d
RUN sed -i.bak '/load="imklog"/d' /etc/rsyslog.conf

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENV GOBIN=/usr/bin
RUN go install github.com/containrrr/shoutrrr/shoutrrr@latest

VOLUME [ "/etc/cron.d" ]
VOLUME [ "/var/log" ]

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]