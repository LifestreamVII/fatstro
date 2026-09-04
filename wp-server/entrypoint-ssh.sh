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

# Ensure WPGraphQL is available once WordPress is installed
(
    while ! wp core is-installed --path=/var/www/html --allow-root >/dev/null 2>&1; do
        sleep 5
    done

    if ! wp plugin is-installed wp-graphql --path=/var/www/html --allow-root >/dev/null 2>&1; then
        wp plugin install wp-graphql --path=/var/www/html --allow-root
    fi

    if ! wp plugin is-active wp-graphql --path=/var/www/html --allow-root >/dev/null 2>&1; then
        wp plugin activate wp-graphql --path=/var/www/html --allow-root
    fi
) &

# Execute the default WordPress entrypoint command
echo "Starting WordPress..."
exec docker-entrypoint.sh apache2-foreground