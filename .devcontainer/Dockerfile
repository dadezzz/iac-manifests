FROM docker.io/library/node:23.9.0-alpine@sha256:dc4d20572e425f9d4c68a6f9c382fbcfec3fa2f8ef0b12cb1d96feabdb479a48

# renovate: datasource=npm depName=pnpm versioning=npm
ENV PNPM_VERSION="10.5.2"
RUN corepack enable && corepack prepare "pnpm@$PNPM_VERSION"

ENV PNPM_HOME="/usr/local/share/pnpm"
ENV PATH="/usr/local/share/pnpm:$PATH"

# renovate: datasource=npm depName=@biomejs/biome versioning=npm
ENV BIOME_VERSION="1.9.4"
RUN pnpm install -g "@biomejs/biome@$BIOME_VERSION"

# hadolint ignore=DL3018
RUN apk add --no-cache git gpg
# kubectl kustomize sops age helm

# COPY --from=docker.io/fluxcd/flux-cli:v2.5.1@sha256:274a179fd40225f7aaeeb8953473381fc6e16154abaa70da0f599d89a610ccee /usr/local/bin/flux /usr/local/bin/

# hadolint ignore=DL3002
USER 0:0
ENTRYPOINT []
HEALTHCHECK NONE
