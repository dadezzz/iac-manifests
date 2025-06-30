FROM docker.io/library/rust:1.88.0-alpine AS build

RUN apk add --no-cache file git make mold musl-dev

# renovate: datasource=gitea-tags depName=Deuxfleurs/garage registryUrl=https://git.deuxfleurs.fr
ENV RENOVATE_VERSION="v2.0.0"
RUN git clone --depth 1 --branch "$RENOVATE_VERSION" https://git.deuxfleurs.fr/Deuxfleurs/garage /srv/garage

ENV RUSTFLAGS="-C target-cpu=native"
COPY config.toml /srv/garage/.cargo/config.toml

WORKDIR /srv/garage

RUN cargo build --release --no-default-features --features lmdb,metrics,bundled-libs

FROM docker.io/library/busybox:1.37.0-musl@sha256:597bf7e5e8faf26b8efc4cb558eea5dc14d9cc97d5b4c8cdbe6404a7432d5a67

COPY --from=build /srv/garage/target/release/garage /usr/bin/garage

ENTRYPOINT ["/usr/bin/garage", "server"]
