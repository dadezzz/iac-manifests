# Talos images configurations

Each file contains the list of host specific customizations made through
[factory.talos.dev](https://factory.talos.dev).

To retrieve the ID of an image run:

```sh
curl -X 'POST' --data-binary '@<HOSTNAME>.yaml' 'https://factory.talos.dev/schematics'
```
