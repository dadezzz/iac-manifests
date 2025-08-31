# Command to generate configs from secrets and patches.

```sh
talosctl gen config \
  --force \
  --with-secrets secrets.yaml \
  --config-patch @patches/base.yaml \
  --config-patch @patches/tailscale.yaml \
  --config-patch-control-plane @patches/controlplane.yaml \
  k8s.zarantonello.dev \
  https://10.95.0.1:6443
```
