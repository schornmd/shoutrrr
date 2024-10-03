# Shoutrrr
custom [shoutrrr](https://containrrr.dev/shoutrrr/v0.8/) docker image with cron integration

```
# ./cron/discord
# daily at 2pm: send a discord webhook message

WEBHOOK_TOKEN=...
WEBHOOK_ID=...

0 14 * * * root shoutrrr send discord://$WEBHOOK_TOKEN@$WEBHOOK_ID "It's 2pm!"
```