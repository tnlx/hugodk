FROM redhat/ubi8-minimal

ENV HUGO_VERSION=0.136.2
ENV SYS_ARCH=Linux-amd64

RUN microdnf install wget gzip tar git

# Install Go toolchains
RUN GO_TAR=go1.23.2.linux-amd64.tar.gz && \
    wget https://go.dev/dl/$GO_TAR && \
    rm -rf /usr/local/go && \
    tar -C /usr/local -xzf go1.23.2.linux-amd64.tar.gz
ENV PATH=$PATH:/usr/local/go/bin

# Install Hugo
RUN HUGO_TAR="hugo_extended_${HUGO_VERSION}_${SYS_ARCH}.tar.gz" && \
    wget "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_TAR}" && \
    tar -C /usr/bin -xzf "$HUGO_TAR"

EXPOSE 1313
WORKDIR /src
ENTRYPOINT ["hugo"]
CMD [""]
