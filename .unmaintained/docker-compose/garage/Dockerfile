FROM  docker.io/dxflrs/garage:v2.0.0@sha256:15b40e0dddd2e611aa746ff6f7c3bfe9f22735e4a2cc29e0abd89c268e9b79d9 AS garage

FROM docker.io/library/busybox:1.37.0-musl@sha256:254e6134b1bf813b34e920bc4235864a54079057d51ae6db9a4f2328f261c2ad

COPY --from=garage /garage /usr/bin/garage

ENTRYPOINT ["/usr/bin/garage", "server"]
