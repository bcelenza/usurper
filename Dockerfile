FROM ubuntu:16.04

RUN apt update \
    && apt install -y --no-install-recommends \
        curl \
        dnsutils \
        iptables \
        iputils-ping \
        less \
        openssh-server \
        openssl \
        net-tools \
    && apt clean \
    && mkdir /var/run/sshd

COPY sshd_config /etc/ssh/sshd_config
COPY id_rsa.pub /root/.ssh/authorized_keys

EXPOSE 22

CMD ["/usr/sbin/sshd", "-De"]
