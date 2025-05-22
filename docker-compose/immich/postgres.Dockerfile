FROM ghcr.io/immich-app/postgres:17-vectorchord0.3.0@sha256:916aeba5a6edb709c45f30777abb08fdb316610405676d24f73ca2cdf138f29e

# Copy the ssd configuration here and avoid immich entrypoint since it requires
# writing permissions on the /etc/postgresql folder.
RUN cp /etc/postgresql/postgresql.ssd.conf /etc/postgresql/postgresql.conf

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh", "postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
