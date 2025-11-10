FROM centos:7

# Install FTP and Telnet servers
RUN yum install -y \
    vsftpd \
    telnet-server \
    xinetd \
    && yum clean all

# Configure vsftpd
RUN mkdir -p /srv/ftp/pub && \
    chmod 755 /srv/ftp/pub && \
    echo "anonymous_enable=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "anon_root=/srv/ftp" >> /etc/vsftpd/vsftpd.conf && \
    echo "no_anon_password=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "listen=YES" >> /etc/vsftpd/vsftpd.conf && \
    echo "listen_ipv6=NO" >> /etc/vsftpd/vsftpd.conf

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
    echo 'systemctl start vsftpd' >> /start.sh && \
    echo 'systemctl start xinetd' >> /start.sh && \
    echo 'tail -f /dev/null' >> /start.sh && \
    chmod +x /start.sh

EXPOSE 21 23

CMD ["/start.sh"]
