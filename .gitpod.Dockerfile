FROM gitpod/workspace-full:2024-06-05-14-45-28

# Install fuse
RUN sudo apt-get update && sudo apt-get install -yq fuse3

# Install rclone
RUN cd /tmp \
    # In future, if this stops working, try https://github.com/rclone/rclone/releases/download/v1.66.0/rclone-v1.66.0-linux-amd64.deb instead.
    # Because, at the time of this writing, rclone was on v1.66.0
    && curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip \
    # No need to delete the downloaded zip as /tmp is tmpfs mount
    && sudo unzip -oj rclone-current-linux-amd64.zip 'rclone-*-linux-amd64/rclone' -d /usr/bin \
    && sudo chmod +x /usr/bin/rclone