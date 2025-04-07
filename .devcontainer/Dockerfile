FROM docker.io/library/node:23.11.0-alpine@sha256:86703151a18fcd06258e013073508c4afea8e19cd7ed451554221dd00aea83fc AS node
FROM docker.io/library/alpine:3.21.3@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c

# Add standard packages for devcontainer

RUN apk add --no-cache git gpg

# Copy nodejs binaries in the new image.

# Required by nodejs.
RUN apk add --no-cache libstdc++

COPY --from=node /usr/local/bin/ /usr/local/bin/
COPY --from=node /usr/local/lib/node_modules/ /usr/local/lib/node_modules/

# Install and setup pnpm.

# renovate: datasource=npm depName=pnpm versioning=npm
ENV PNPM_VERSION="10.8.0"
RUN corepack enable pnpm && corepack prepare "pnpm@$PNPM_VERSION"

ENV PNPM_HOME="/usr/local/share/pnpm"
ENV PATH="/usr/local/share/pnpm:$PATH"

# Install biomejs

# # renovate: datasource=npm depName=@biomejs/biome versioning=npm
ENV BIOME_VERSION="1.9.4"
RUN pnpm install -g "@biomejs/biome@$BIOME_VERSION"

# Install tools to manage k8s.

RUN apk add --no-cache kubectl sops age helm kustomize
COPY --from=docker.io/fluxcd/flux-cli:v2.5.1@sha256:274a179fd40225f7aaeeb8953473381fc6e16154abaa70da0f599d89a610ccee /usr/local/bin/flux /usr/local/bin/

USER 0:0
ENTRYPOINT []
HEALTHCHECK NONE
