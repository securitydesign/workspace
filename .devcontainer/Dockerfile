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
    graphviz \
    entr

# Install tools, libraries, etc.
RUN ARCH=$(uname -m) && \
    case "$ARCH" in \
        x86_64) GO_ARCH="amd64" ;; \
        aarch64) GO_ARCH="arm64" ;; \
        *) echo "Unsupported architecture: $ARCH" >&2; exit 1 ;; \
    esac && \
    curl -O https://dl.google.com/go/go1.20.6.linux-${GO_ARCH}.tar.gz \
    && tar -xvf go1.20.6.linux-${GO_ARCH}.tar.gz \
    && mv go /usr/local \
    && rm go1.20.6.linux-${GO_ARCH}.tar.gz

# Install ADM and ADSM
RUN cd "$HOME" && \
    git clone https://github.com/vinayprograms/adm && \
    cd adm && make build && cp bin/adm /usr/bin/
#RUN cd "$HOME" && \
#    git clone https://github.com/vinayprograms/adsm && \
#    cd adsm && make build && cp bin/adsm /usr/bin/

# Clone ADDB
RUN git clone https://github.com/securitydesign/addb /usr/share/addb
