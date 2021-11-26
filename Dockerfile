FROM centos:centos8

RUN echo "trino soft nofile 131072" >> /etc/security/limits.d/trino.conf && \
    echo "trino hard nofile 131072" >> /etc/security/limits.d/trino.conf

RUN yum makecache && \
    yum install -y python3 && \
    yum install -y java-11-openjdk-devel && \
    ln -s /usr/bin/python3 /usr/bin/python

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk
ENV PATH=$PATH:${JAVA_HOME}/bin

# must give the name of trino server package
ARG TRINO_SERVER_PACKAGE
ADD ${TRINO_SERVER_PACKAGE}.tar.gz /
RUN ln -s /${TRINO_SERVER_PACKAGE} /trino

# must mount /trino-etc when docker run
ENTRYPOINT ["/trino/bin/launcher", "--etc-dir=/trino-etc", "run"]
