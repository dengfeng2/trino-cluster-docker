FROM ubuntu:20.04

RUN echo "trino soft nofile 131072" >> /etc/security/limits.d/trino.conf && \
    echo "trino hard nofile 131072" >> /etc/security/limits.d/trino.conf

COPY tsinghua.list /etc/apt/sources.list.d/
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
RUN apt update && \
    apt install -y python3 && \
    apt install -y openjdk-11-jdk && \
    ln -s /usr/bin/python3 /usr/bin/python

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$PATH:${JAVA_HOME}/bin

# must give the name of trino server package
RUN mkdir -p /opt
ARG TRINO_SERVER_PACKAGE
ADD ${TRINO_SERVER_PACKAGE}.tar.gz /opt/
RUN ln -s /opt/${TRINO_SERVER_PACKAGE} /opt/trino

# must mount /trino-etc when docker run
ENTRYPOINT ["/opt/trino/bin/launcher", "--etc-dir=/trino-etc", "run"]
