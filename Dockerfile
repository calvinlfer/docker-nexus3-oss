FROM sonatype/nexus3:3.10.0

COPY entry-point /usr/local/bin/

# Become the root user and install AWS CLI
USER root
RUN yum -y update && yum -y install epel-release && yum -y install python-pip
RUN pip install awscli

# and gosu (Credits: https://git.io/vpcMB)
ARG GOSU_VERSION=1.10
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64.asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && rm -r /root/.gnupg/ \
    && chmod +x /usr/local/bin/gosu

# SONATYPE_DIR is inherited from base container
ENTRYPOINT ["/usr/local/bin/entry-point", "sh", "-c", "${SONATYPE_DIR}/start-nexus-repository-manager.sh"]
