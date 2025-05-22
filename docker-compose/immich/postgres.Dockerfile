FROM ghcr.io/immich-app/postgres:16-vectorchord0.3.0-pgvectors0.3.0

# Copy the ssd configuration here and avoid immich entrypoint since it requires
# writing permissions on the /etc/postgresql folder.
RUN cp /etc/postgresql/postgresql.ssd.conf /etc/postgresql/postgresql.conf

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
