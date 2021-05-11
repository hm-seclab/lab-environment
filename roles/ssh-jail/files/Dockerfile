FROM debian
RUN apt update && \
    apt upgrade -y && \
    apt install -y sudo nano acl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*