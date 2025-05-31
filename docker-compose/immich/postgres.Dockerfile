FROM ghcr.io/immich-app/postgres:17-vectorchord0.3.0@sha256:c5d817fc423270179e2f5eee84cd699d0b6ad210ab5230ed5cd988265897913a

# Copy the ssd configuration here and avoid immich entrypoint since it requires
# writing permissions on the /etc/postgresql folder.
RUN cp /var/postgresql-conf-tpl/postgresql.ssd.conf /etc/postgresql/postgresql.conf

# Replace env var placeholder with static path.
RUN sed -i "s|##PGDATA|/var/lib/postgresql/data|" /etc/postgresql/postgresql.conf

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
