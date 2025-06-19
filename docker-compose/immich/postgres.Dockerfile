FROM ghcr.io/immich-app/postgres:17-vectorchord0.4.2@sha256:1ab7d94013ef6bb3873065f254bb01fd849cc4f19246065412c416ecdd301e5d

# Copy the ssd configuration here and avoid immich entrypoint since it requires
# writing permissions on the /etc/postgresql folder.
RUN cp /var/postgresql-conf-tpl/postgresql.ssd.conf /etc/postgresql/postgresql.conf

# Replace env var placeholder with static path.
RUN sed -i "s|##PGDATA|/var/lib/postgresql/data|" /etc/postgresql/postgresql.conf

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["postgres", "-c", "config_file=/etc/postgresql/postgresql.conf"]
