FROM golang:1.23.2

RUN apt update && apt install cron -y

ENV GOBIN=/usr/local/bin
RUN go install github.com/containrrr/shoutrrr/shoutrrr@latest

CMD ["cron", "-f"]