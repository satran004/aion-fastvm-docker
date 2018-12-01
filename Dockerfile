FROM ubuntu:16.04

RUN apt-get update && apt-get install -y wget libicu55 libedit2 libffi6 libtinfo5 libboost-all-dev llvm-4.0-dev bzip2

RUN mkdir /root/app
RUN mkdir /root/app/native
RUN mkdir /root/app/java
RUN mkdir /project
RUN mkdir /root/.m2

WORKDIR /root/app

## Environment variables for build ##
ARG SOLIDITY_DOWNLOAD_URL=https://github.com/aionnetwork/aion_fastvm/releases/download/v0.3.2/solidity_v0.3.2.tar.gz
ARG SOLIDITY_PKG=solidity_v0.3.2

ARG FASTVM_DOWNLOAD_URL=https://github.com/aionnetwork/aion_fastvm/releases/download/v0.3.2/fastvm_v0.3.2.tar.gz
ARG FASTVM_PKG=fastvm_v0.3.2

ARG AION_DOWNLOAD_URL=https://github.com/aionnetwork/aion/releases/download/v0.3.2/aion-v0.3.2.a0b68b7-2018-11-29.tar.bz2
ARG AION_PKG_PREFIX=aion-v0.3.2.a0b68b7-2018-11-29
ARG AION_VERSION=v0.3.2

ARG JAVA_DOWNLOAD_URL=https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz
ARG JAVA_PKG_PREFIX=openjdk-11.0.1_linux-x64_bin
ARG JAVA_FOLDER=jdk-11.0.1
## Build env ends ##

RUN wget $SOLIDITY_DOWNLOAD_URL
RUN wget $FASTVM_DOWNLOAD_URL

RUN gunzip $SOLIDITY_PKG.tar.gz && tar xvf $SOLIDITY_PKG.tar
RUN gunzip $FASTVM_PKG.tar.gz && tar xvf $FASTVM_PKG.tar

RUN ln -s /root/app/$SOLIDITY_PKG /root/app/native/solidity
RUN ln -s /root/app/$FASTVM_PKG /root/app/native/fastvm

#cleanup
RUN rm -f $SOLIDITY_PKG.tar
RUN rm -f $FASTVM_PKG.tar

### Get Aion Libraries ###
RUN wget $AION_DOWNLOAD_URL
RUN bunzip2 $AION_PKG_PREFIX.tar.bz2 && tar xvf $AION_PKG_PREFIX.tar

#cleanup
RUN rm -f $AION_PKG_PREFIX.tar

COPY ./files/setenv.sh ./
RUN chmod +x setenv.sh
### Aion library ends ###

## Get jdk 11 ##
WORKDIR /root/app/java

RUN wget $JAVA_DOWNLOAD_URL
RUN gunzip $JAVA_PKG_PREFIX.tar.gz && tar xvf $JAVA_PKG_PREFIX.tar
RUN ln -s /root/app/java/$JAVA_FOLDER /root/app/java/latest


## jdk ends ##

WORKDIR /project

ENV JAVA_OPTS="-Dfile.encoding=utf8"
ENV MAVEN_HOME=/root/maven_home
ENV ANT_HOME=/root/ant_home
ENV PATH="/root/app/native/solidity/:/root/app/java/latest/bin:$MAVEN_HOME/bin:$ANT_HOME/bin:${PATH}"