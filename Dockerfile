FROM ubuntu:14.04
MAINTAINER Arcus "http://arcus.io"
ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_HOME /opt/jdk/jre
ENV PATH $PATH:/opt/jdk/jre/bin
RUN apt-get update && \
    apt-get install -y wget unzip
RUN (cd /tmp && wget --progress=dot --no-check-certificate -O jdk.tar.gz --header "Cookie: oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/7u65-b17/jdk-7u65-linux-x64.tar.gz && \
    tar zxf jdk.tar.gz && mv jdk1.7.0_65 /opt/jdk)

RUN (cd /tmp && \
    wget http://downloads.sourceforge.net/project/lportal/Liferay%20Portal/6.2.1%20GA2/liferay-portal-tomcat-6.2-ce-ga2-20140319114139101.zip -O liferay.zip && \
    unzip liferay.zip -d /opt && \
    rm -f liferay.zip)
ADD conf/portal-bundle.properties /opt/liferay-portal-6.2-ce-ga2/portal-bundle.properties
ADD conf/portal-db.properties /opt/liferay-portal-6.2-ce-ga2/portal-db.properties
EXPOSE 8080
ENTRYPOINT ["/opt/liferay-portal-6.2-ce-ga2/tomcat-7.0.42/bin/catalina.sh"]
CMD ["run"]
