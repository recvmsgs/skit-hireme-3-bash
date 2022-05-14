#!/bin/bash -xv

DIR="$PWD"

echo WORKDIR="$PWD" >> ./config.sh

sudo apt -y install libio-socket-ssl-perl libnet-ssleay-perl sendemail

chmod u+x ./*.sh; chmod go-rwx ./config.sh

{ crontab -l; \
echo \
'# m h day mon wkday   command
  0 */1  *  *     *    '"$PWD"'/status.sh' ; } \
 | crontab - ;
 crontab -l
