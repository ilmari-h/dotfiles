#!/bin/sh
LOGDIR=$HOME/.cache/rsync-jobs
REMOTE="pi@192.168.1.3"
#declare -A TO_SYNC
#TO_SYNC[${HOME}/Pictures]]="/user"
#TO_SYNC["${HOME}/Music]"] = "/user"
#TO_SYNC["${HOME}/Videos]"] = "/user"
#TO_SYNC["${HOME}/Documents]"] = "/user"
#TO_SYNC["${HOME}/Workspaces]"] = "/user"
#TO_SYNC["/mnt/disk1/library"] = "/"

notify_error() {
  notify-send -c "transfer.error" "Failed to sync files." "Log: ${LOGDIR}/rsync-jobs.log" &&
  exit 1
}

do_rsync() {
  rsync -aP --delete /home/pazu/Pictures pi@192.168.1.3:/mnt/hdd1/sync/user &&
  rsync -aP --delete /home/pazu/Music pi@192.168.1.3:/mnt/hdd1/sync/user &&
  rsync -aP --delete /home/pazu/Videos pi@192.168.1.3:/mnt/hdd1/sync/user &&
  rsync -aP --delete /home/pazu/Documents pi@192.168.1.3:/mnt/hdd1/sync/user &&
  rsync -aP --delete /home/pazu/Workspaces pi@192.168.1.3:/mnt/hdd1/sync/user &&
  rsync -aP --delete /mnt/disk1/library pi@192.168.1.3:/mnt/hdd1/sync
}

mkdir -p $LOGDIR
do_rsync > $LOGDIR/rsync-jobs.log || notify_error && 
notify-send "All files synced." "Log: ${LOGDIR}/rsync-jobs.log" &&
exit 0
