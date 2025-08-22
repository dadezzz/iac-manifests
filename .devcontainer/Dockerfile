FROM docker.io/library/node:23.11.1-alpine@sha256:a34e14ef1df25b58258956049ab5a71ea7f0d498e41d0b514f4b8de09af09456

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
