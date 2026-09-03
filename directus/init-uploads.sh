#!/bin/sh
# directus/init-uploads.sh
#
# Downloads placeholder images into /directus/uploads on first container start.
# Uses the exact UUID filenames that directus_files seed rows reference, so
# Posts.image foreign keys resolve correctly.
#
# Thumbnail variants (filenames with __<hash>.jpeg) are generated on-demand by
# Directus when a transform request arrives — they do not need to be seeded.
#
# This script is idempotent: files that already exist are not re-downloaded.

set -e

UPLOADS=/directus/uploads
mkdir -p "$UPLOADS"

download_if_missing() {
  local dest="$UPLOADS/$1"
  local url="$2"
  if [ ! -f "$dest" ]; then
    echo "[init-uploads] Downloading $1 ..."
    wget -q -O "$dest" "$url"
  else
    echo "[init-uploads] $1 already present, skipping."
  fi
}

# Post cover images (3072×2048 placeholders from picsum.photos)
# Each UUID matches the corresponding directus_files row in init.sql.
download_if_missing \
  "2c5d3509-77ed-43ec-b0bc-7c267dbd434b.jpeg" \
  "https://picsum.photos/3072/2048"

download_if_missing \
  "be5f1382-41ff-47ee-bcc0-9db0397b3973.jpeg" \
  "https://picsum.photos/3072/2048"

download_if_missing \
  "4054c42b-3a42-4038-ab02-76925a2d9936.jpeg" \
  "https://picsum.photos/3072/2048"
