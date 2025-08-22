FROM docker.io/library/node:23.11.0-alpine@sha256:86703151a18fcd06258e013073508c4afea8e19cd7ed451554221dd00aea83fc

# Add standard packages for devcontainer

RUN apk add --no-cache git gpg

# Install and setup pnpm.

# renovate: datasource=npm depName=pnpm versioning=npm
ENV PNPM_VERSION="10.8.0"
RUN corepack enable pnpm && corepack prepare "pnpm@$PNPM_VERSION"

ENV PNPM_HOME="/usr/local/share/pnpm"
ENV PATH="/usr/local/share/pnpm:$PATH"

# Install linting tools.

# # renovate: datasource=npm depName=@biomejs/biome versioning=npm
ENV BIOME_VERSION="2.2.0"
RUN pnpm install -g "@biomejs/biome@$BIOME_VERSION"

# # renovate: datasource=npm depName=prettier versioning=npm
ENV PRETTIER_VERSION="3.6.2"
RUN pnpm install -g "prettier@$PRETTIER_VERSION"

RUN apk add --no-cache yamllint

# Install tools to manage k8s.

RUN apk add --no-cache kubectl sops age helm kustomize
COPY --from=docker.io/fluxcd/flux-cli:v2.5.1@sha256:274a179fd40225f7aaeeb8953473381fc6e16154abaa70da0f599d89a610ccee /usr/local/bin/flux /usr/local/bin/

USER 0:0
ENTRYPOINT []
HEALTHCHECK NONE
