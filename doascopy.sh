#!/bin/bash
from=$1
to=$2
user=$3
statusfile=$4

create_copy () {
    echo 1 > "/tmp/doasedit.status"
    chown $user "/tmp/doasedit.status"
}

cp $from $to &&
chmod a=rw $to &&
create_copy &&

while true
do
    if [[ ! -f $statusfile ]]; then
      break;
    else 
      sleep 0.1;
    fi
done &&

mv $to $from

exit 0
