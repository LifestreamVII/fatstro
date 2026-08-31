#!/bin/bash
set -e

# Change root password dynamically if ROOT_PASSWORD is provided
if [ ! -z "$ROOT_PASSWORD" ]; then
    echo "root:$ROOT_PASSWORD" | chpasswd
    echo "Root password updated."
fi

# Start SSH daemon in the background
echo "Starting OpenSSH server..."
/usr/sbin/sshd

# Execute the default WordPress entrypoint command
echo "Starting WordPress..."
exec docker-entrypoint.sh apache2-foreground