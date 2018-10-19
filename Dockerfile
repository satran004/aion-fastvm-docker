FROM ubuntu:16.04

RUN apt-get update && apt-get install -y wget libicu55 libedit2 libffi6 libtinfo5 libboost-all-dev llvm-4.0-dev

RUN mkdir /root/app
RUN mkdir /root/app/native
RUN mkdir /src

WORKDIR /root/app

ENV SOLIDITY_PKG solidity_v0.3.1
ENV FASTVM_PKG fastvm_v0.3.1

RUN wget https://github.com/aionnetwork/aion_fastvm/releases/download/v0.3.1/solidity_v0.3.1.tar.gz
RUN wget https://github.com/aionnetwork/aion_fastvm/releases/download/v0.3.1/fastvm_v0.3.1.tar.gz

RUN gunzip $SOLIDITY_PKG.tar.gz && tar xvf $SOLIDITY_PKG.tar
RUN gunzip $FASTVM_PKG.tar.gz && tar xvf $FASTVM_PKG.tar

RUN ln -s /root/app/$SOLIDITY_PKG /root/app/native/solidity
RUN ln -s /root/app/$FASTVM_PKG /root/app/native/fastvm


WORKDIR /src

ENV PATH="/root/app/native/solidity/:${PATH}"
