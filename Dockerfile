FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    openssh-server \
    wget

RUN mkdir /var/run/sshd
RUN useradd -m -s /bin/bash user && echo "user:pass123" | chpasswd
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

RUN wget https://github.com/vi/websocat/releases/download/v1.11.0/websocat.x86_64-unknown-linux-musl -O /usr/local/bin/websocat
RUN chmod +x /usr/local/bin/websocat

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8000

CMD ["/start.sh"]
