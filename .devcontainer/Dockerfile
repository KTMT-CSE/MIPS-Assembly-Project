FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y openjdk-17-jdk python3 python3-pip git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir pytest

WORKDIR /workspace

COPY . /workspace
