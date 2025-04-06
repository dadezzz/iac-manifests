# Docker compose

Docker compose is the method that I currently use to deploy containers.

Most of the containers are deployed only on one host except for those that would
normally run as a DaemonSet in kubernetes. To set specific options for each set
I extend base docker compose files with configurations based on the hostname of
the targeted node.

## Node setup

This section contains some settings that I used on my servers to increase
performance or fix warnings.

### Docker daemon

Create the file `/etc/docker/daemon.json` with contents:

```json
{
  "log-driver": "local",
  "metrics-addr": "127.0.0.1:9323",
  "features": {
    "containerd-snapshotter": true
  }
}
```

### Sysctl

Create the file `/etc/sysctl.d/80-quic.conf` with contents:

```ini
net.core.rmem_max=7500000
net.core.wmem_max=7500000
```
