# nfsync

A container for rsyncing data to or from a NFS share inspired by [flaccid's docker-nfs-client](https://github.com/flaccid/docker-nfs-client).

## Usage

Build the container.

```sh
docker build -t nfsync .
```

Run the container. Here's how I copy data from `example.com:/data/` to `/data`.

```sh
docker run -itd --rm \
    --privileged=true \
    --net=host \
    --name nfsync \
    -v /data:/data \
    -e SERVER=example.com \
    -e SHARE=data \
    -e MOUNTPOINT=/mnt/nfs/example.com/data \
    nfsync -aHAX --numeric-ids --progress -e "ssh -T -c aes128-gcm@openssh.com -o Compression=no -x" \
    /mnt/nfs/example.com/data/ \
    /data
```
