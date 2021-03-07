FROM nvidia/cuda:11.0-devel-ubuntu20.04

MAINTAINER Daniil Larionov

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /

RUN apt update && apt install --yes wget

RUN wget https://github.com/no-fee-ethereum-mining/nsfminer/releases/download/v1.3.8/nsfminer_1.3.8-ubuntu_20.04-cuda_11.2-opencl.tgz
RUN tar xvf nsfminer_1.3.8-ubuntu_20.04-cuda_11.2-opencl.tgz

ENTRYPOINT ["/nsfminer", "-U"]
