FROM wordpress:latest

# Install additional tools
RUN apt-get update && apt-get install -y \
    curl \
    nano \
    openssh-server \
    wget \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Configure Root SSH access
RUN mkdir -p /var/run/sshd && \
    echo 'root:root' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Create WordPress uploads directory
RUN mkdir -p /var/www/html/wp-content/uploads && \
    chown -R www-data:www-data /var/www/html/wp-content

# Copy the custom entrypoint script
COPY entrypoint-ssh.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint-ssh.sh

RUN echo "export WP_CLI_ALLOW_ROOT='1'" >> /root/.bashrc

# Expose HTTP (80) and SSH (22)
EXPOSE 80 22

# Overwrite the original entrypoint to handle both Apache and SSH
ENTRYPOINT ["entrypoint-ssh.sh"]