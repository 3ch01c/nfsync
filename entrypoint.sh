#!/bin/sh -e

# set us up the nfs
mkdir -p "$MOUNTPOINT"
rpcbind -f &
mount -t "$FSTYPE" -o "$MOUNT_OPTIONS" "$SERVER:$SHARE" "$MOUNTPOINT"

# sync the files
rsync "$@"