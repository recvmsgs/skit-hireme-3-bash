#!/bin/bash -xv

{
[[ -z "${SKIT_ALERT_EMAIL}" ]] && source ./config.sh

cd "$WORKDIR"
echo "$PWD" "$SKIT_ALERT_EMAIL"

URL='https://status.digitalocean.com/api/v2/summary.json'

[[ "$1" = 'test' ]] && URL='https://status.digitalocean.com/api/v2/scheduled-maintenances.json'

RESPONSE="$(curl -s $URL)"

MSGFILE="/tmp/do-alert----4f28affe-0f5b-4003-99c9.json"

{ echo "$RESPONSE" \
    | fgrep '"status":"operational",' | fgrep '"incidents":[],' | fgrep '"scheduled_maintenances":[],';
}   \
&&  {
    echo OOOOOOOOOOOK ;
    } \
||  {
    echo BAAAAAAAAAAD;
    echo "$RESPONSE" | python3 -m json.tool >| "$MSGFILE";
    sendemail -f "$MAIL_FROM"  -t "$SKIT_ALERT_EMAIL" -u 'DigitalOcean ALERT' \
              -m "ALERT, see https://status.digitalocean.com/ or the  attachment" -a "$MSGFILE"  \
              -s "$SMTP_ADDR":"$SMTP_PORT" -o tls=yes -xu "$MAIL_FROM" -xp "$MAIL_PASS";
    exit 1;
    }
} >| ./log 2>> ./log
