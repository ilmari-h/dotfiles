#!/bin/bash
from=$1
to=$2
user=$3
statusfile=$4
permissions=$(stat -c %a $from)

create_copy () {
    echo 1 > $statusfile
    chown $user $statusfile
}

cp $from $to &&
chmod a=rw $to &&
create_copy &&

# Wait for editor to close
while true
do
    if [[ ! -f $statusfile ]]; then
      break;
    else 
      sleep 0.1;
    fi
done &&

mv $to $from &&
chmod $permissions $from &&

exit 0
