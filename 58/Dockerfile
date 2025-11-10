FROM centos:7

RUN yum install -y \
    ypserv \
    ypbind \
    nfs-utils \
    && yum clean all

RUN mkdir -p /export/shared && chmod 777 /export/shared

CMD ["tail", "-f", "/dev/null"]
