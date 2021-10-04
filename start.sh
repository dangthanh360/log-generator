#!/bbin/bash

flog -l  -d 1s -n 1 -f json -w | nc $SYSLOG_HOST $SYSLOG_PORT &

flog -l  -d 1s -n 1 -f json -w | logger -n $SYSLOG_HOST -P $SYSLOG_PORT -T --octet-count