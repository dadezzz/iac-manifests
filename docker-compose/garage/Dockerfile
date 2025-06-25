FROM  docker.io/dxflrs/garage:v2.0.0@sha256:15b40e0dddd2e611aa746ff6f7c3bfe9f22735e4a2cc29e0abd89c268e9b79d9 AS garage

FROM docker.io/library/busybox:1.37.0-musl@sha256:597bf7e5e8faf26b8efc4cb558eea5dc14d9cc97d5b4c8cdbe6404a7432d5a67

COPY --from=garage /garage /usr/bin/garage

ENTRYPOINT ["/usr/bin/garage", "server"]
