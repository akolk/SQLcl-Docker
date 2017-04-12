FROM oraclelinux:latest

EXPOSE 8080

ADD sqlcl-* .
RUN yum -y install wget unzip java-1.8.0-openjdk-devel \
     && unzip sqlcl*.zip \
     && yum clean all
ENV PATH=sqlcl/bin:$PATH

VOLUME ["/scripts", "/scripts-lib", "/scripts-config", "/logon", "/http-client" ]
ENV SQLPATH=/scripts:/scripts-lib:/scripts-config:/logon
ENTRYPOINT ["/bin/bash", "/sqlcl/bin/sql" ]
