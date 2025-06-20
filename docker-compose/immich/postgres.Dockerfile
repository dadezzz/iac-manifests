FROM ghcr.io/immich-app/postgres:17-vectorchord0.4.2@sha256:38df86a4ebd4b7d2c6187e779580f36d54e0bc42a584c3ab7bdfb6bd2ba3c5fd

# Copy the ssd configuration here and avoid immich entrypoint since it requires
# writing permissions on the /etc/postgresql folder.
RUN cp /var/postgresql-conf-tpl/postgresql.ssd.conf /etc/postgresql/postgresql.conf

# Replace env var placeholder with static path.
RUN sed -i "s|##PGDATA|/var/lib/postgresql/data|" /etc/postgresql/postgresql.conf

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
