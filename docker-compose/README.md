# Docker compose

## Node setup

### Docker daemon

Create the file `/etc/docker/daemon.json` with contents:

```json
{
  "log-driver": "local",
  "metrics-addr": "127.0.0.1:9323"
}
```

### Sysctl

Create the file `/etc/sysctl.d/80-quic.conf` with contents:

```ini
net.core.rmem_max=7500000
net.core.wmem_max=7500000
```
