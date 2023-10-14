# Use an official base image
FROM debian:buster-slim as base

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Set environment variables for Go
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

# Install any required tools
RUN apt-get update && apt-get install -y \
    git \
    curl \
    vim \
    nano \
    make \
    graphviz

# Install tools, libraries, etc.
RUN curl -O https://dl.google.com/go/go1.20.6.linux-arm64.tar.gz \
    && tar -xvf go1.20.6.linux-arm64.tar.gz \
    && mv go /usr/local \
    && rm go1.20.6.linux-arm64.tar.gz

# Install ADM and ADSM
RUN cd "$HOME" && \
    git clone https://github.com/vinayprograms/adm && \
    cd adm && make build && cp bin/adm /usr/bin/
RUN cd "$HOME" && \
    git clone https://github.com/vinayprograms/adsm && \
    cd adsm && make build && cp bin/adsm /usr/bin/

# Clone ADDB
RUN git clone https://github.com/securitydesign/addb /usr/share/addb