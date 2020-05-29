FROM alpine
LABEL maintainer="Jack Miner <3ch01c@gmail.com>"

ENV FSTYPE nfs4
ENV MOUNT_OPTIONS nfsvers=4
ENV MOUNTPOINT /mnt/nfs/noname

RUN apk add \
  findutils \
  nfs-utils \
  rsync \
  && rm -rf /var/cache/apk/*

# would only be used if extending an running a different main process in fg
# RUN rc-update add nfs

# https://github.com/rancher/os/issues/641#issuecomment-157006575
RUN rm /sbin/halt /sbin/poweroff /sbin/reboot

COPY entrypoint.sh .

ENTRYPOINT [ "./entrypoint.sh" ]
CMD [ "-h" ]