FROM ubuntu:14.04
MAINTAINER Arcus "http://arcus.io"
ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_HOME /opt/jdk/jre
ENV PATH $PATH:/opt/jdk/jre/bin
RUN apt-get update && \
    apt-get install -y wget unzip
RUN (cd /tmp && wget --progress=dot --no-check-certificate -O jdk.tar.gz --header "Cookie: oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/7u65-b17/jdk-7u65-linux-x64.tar.gz && \
    tar zxf jdk.tar.gz && mv jdk1.7.0_65 /opt/jdk)

