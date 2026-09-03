# directus/Dockerfile
# Extends the official Directus image with the sqlite3 CLI, which is needed
# to seed the database from init.sql on first container start.
# The sqlite3 npm package (better-sqlite3) is already bundled by Directus;
# this adds only the CLI binary (~350 KB, Alpine package).

FROM directus/directus:10.8.3

USER root
RUN apk add --no-cache sqlite

USER node
