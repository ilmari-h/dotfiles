#!/bin/sh
LOGDIR=$HOME/.cache/rsync-jobs
do_rsync() {
  rsync -aP --delete /home/pazu/Pictures pi@192.168.1.3:/mnt/hdd1/sync/user &&
  rsync -aP --delete /home/pazu/Music pi@192.168.1.3:/mnt/hdd1/sync/user &&
  rsync -aP --delete /home/pazu/Videos pi@192.168.1.3:/mnt/hdd1/sync/user &&
  rsync -aP --delete /home/pazu/Documents pi@192.168.1.3:/mnt/hdd1/sync/user &&
  rsync -aP --delete /home/pazu/Workspaces pi@192.168.1.3:/mnt/hdd1/sync/user &&
  rsync -aP --delete /mnt/disk1/library pi@192.168.1.3:/mnt/hdd1/sync
}

mkdir -p $LOGDIR
do_rsync > $LOGDIR/rsync-jobs.log && 
  notify-send "All files synced." "Log: ${LOGDIR}/rsync-jobs.log"

