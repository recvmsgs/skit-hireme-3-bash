#!/bin/bash -x

WORKDIR="$PWD"

echo WORKDIR="$WORKDIR" >> ./config.sh

sudo apt -y install libio-socket-ssl-perl libnet-ssleay-perl sendemail

chmod u+x ./install.sh ./status.sh; chmod go-rwx ./config.sh

{ crontab -l | sed -e '/\/status.sh/d' -e '/mon wkday /d'; \
echo \
'# m  h   day mon wkday   command
   0 */1  *    *     *    '"$PWD"'/status.sh' ; } \
 | crontab - ;
 crontab -l
 
