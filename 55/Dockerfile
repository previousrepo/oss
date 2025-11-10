FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install FTP and Telnet servers
RUN apt-get update && apt-get install -y \
    vsftpd \
    telnetd \
    xinetd \
    && rm -rf /var/lib/apt/lists/*

# Configure vsftpd
RUN mkdir -p /srv/ftp/pub && \
    chmod 755 /srv/ftp/pub && \
    echo "anonymous_enable=YES" >> /etc/vsftpd.conf && \
    echo "anon_root=/srv/ftp" >> /etc/vsftpd.conf && \
    echo "no_anon_password=YES" >> /etc/vsftpd.conf && \
    echo "listen=YES" >> /etc/vsftpd.conf && \
    echo "listen_ipv6=NO" >> /etc/vsftpd.conf

# Configure Telnet
RUN echo "service telnet" > /etc/xinetd.d/telnet && \
    echo "{" >> /etc/xinetd.d/telnet && \
    echo "    disable = no" >> /etc/xinetd.d/telnet && \
    echo "    flags = REUSE" >> /etc/xinetd.d/telnet && \
    echo "    socket_type = stream" >> /etc/xinetd.d/telnet && \
    echo "    wait = no" >> /etc/xinetd.d/telnet && \
    echo "    user = root" >> /etc/xinetd.d/telnet && \
    echo "    server = /usr/sbin/in.telnetd" >> /etc/xinetd.d/telnet && \
    echo "    log_on_failure += USERID" >> /etc/xinetd.d/telnet && \
    echo "}" >> /etc/xinetd.d/telnet

# Create startup script
RUN echo '#!/bin/bash' > /start.sh && \
    echo 'service vsftpd start' >> /start.sh && \
    echo 'service xinetd start' >> /start.sh && \
    echo 'tail -f /dev/null' >> /start.sh && \
    chmod +x /start.sh

EXPOSE 21 23

CMD ["/start.sh"]
