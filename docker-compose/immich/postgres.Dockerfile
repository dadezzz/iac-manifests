FROM ghcr.io/immich-app/postgres:17-vectorchord0.3.0@sha256:8b3dd6de05a9c52da5ad322a2e335c711ed19d51dc8c14f909f05728fc6f2474

# Copy the ssd configuration here and avoid immich entrypoint since it requires
# writing permissions on the /etc/postgresql folder.
RUN cp /etc/postgresql/postgresql.ssd.conf /etc/postgresql/postgresql.conf

# Replace env var placeholder with static path.
RUN sed -i "s|##PGDATA|/var/lib/postgresql/data|" /etc/postgresql/postgresql.conf

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh", "postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
