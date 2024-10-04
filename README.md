# Shoutrrr
custom [shoutrrr](https://containrrr.dev/shoutrrr/v0.8/) docker image with cron integration

> [!WARNING]
> This image does not work well with WSL or Windows!

```
# ./cron/discord
# daily at 2pm: send a discord webhook message
# you can use docker environment variables!

0 14 * * * root shoutrrr send discord://$WEBHOOK_TOKEN@$WEBHOOK_ID "It's 2pm!" >> /var/log/shoutrrr.log 2>&1
```