#!/bin/bash -x

WORKDIR="$PWD"
sed -i '/^WORKDIR=/d' ./config.sh
echo WORKDIR="$WORKDIR" >> ./config.sh

eval "$@"
echo "$@"

[[ ! -z "$SKIT_ALERT_EMAIL" ]] \
   && echo SKIT_EMAIL \
   && sed -i '/^SKIT_ALERT_EMAIL=/d' ./config.sh \
   && echo 'SKIT_ALERT_EMAIL='"$SKIT_ALERT_EMAIL" >> ./config.sh
[[ ! -z "$MAIL_FROM" ]] \
   && echo MAIL_FROM \
   && sed -i '/^MAIL_FROM=/d' ./config.sh \
   && echo 'MAIL_FROM='"$MAIL_FROM" >> ./config.sh
[[ ! -z "$MAIL_ADDR" ]] \
  && echo MAIL_ADDR \
  && sed -i '/^MAIL_ADDR=/d' ./config.sh \
  && echo 'MAIL_ADDR='"$MAIL_ADDR" >> ./config.sh
[[ ! -z "$MAIL_PORT" ]] \
  && echo MAIL_PORT \
  && sed -i '/^MAIL_PORT=/d' ./config.sh \
  && echo 'MAIL_PORT='"$MAIL_PORT" >> ./config.sh


sudo apt -y install libio-socket-ssl-perl libnet-ssleay-perl sendemail

chmod u+x ./install.sh ./status.sh; chmod go-rwx ./config.sh

{ crontab -l | sed -e '/\/status.sh/d' -e '/mon wkday /d'; \
echo \
'# m  h   day mon wkday   command
   0 */1  *    *     *    '"$WORKDIR"'/status.sh' ; } \
 | crontab - ;
 crontab -l

