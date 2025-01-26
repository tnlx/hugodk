# ---------------------------------------------
# Base: OS + utilities/packages
# ---------------------------------------------

FROM redhat/ubi8-minimal AS base

ARG SYS_ARCH=Linux-amd64
ARG HUGO_VERSION=0.142.0
ARG DART_VERSION=1.83.4
ARG GO_TAR=go1.23.5.linux-amd64.tar.gz

RUN microdnf install gzip tar git

# ---------------------------------------------
# Go toolchain
# ---------------------------------------------

FROM base AS go
ARG GO_TAR

# Install Go toolchains
ADD https://go.dev/dl/$GO_TAR .
RUN tar -C /usr/local -xzf $GO_TAR && rm $GO_TAR
ENV PATH=$PATH:/usr/local/go/bin

# ---------------------------------------------
# Hugo & related toolkits
# ---------------------------------------------

FROM go AS hugo
ARG SYS_ARCH
ARG HUGO_VERSION
ARG DART_VERSION

# Install Hugo
ARG HUGO_TAR=hugo_extended_${HUGO_VERSION}_${SYS_ARCH}.tar.gz
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_TAR} .
RUN tar -C /usr/bin -xzf "$HUGO_TAR" && rm $HUGO_TAR

# Install dart-sass
ARG DART_TAR=dart-sass-${DART_VERSION}-linux-x64.tar.gz
ADD https://github.com/sass/dart-sass/releases/download/${DART_VERSION}/${DART_TAR} .
RUN tar -C /usr/bin -xzf "$DART_TAR" && rm $DART_TAR
ENV PATH="/usr/bin/dart-sass:$PATH"

EXPOSE 1313
RUN mkdir -p /src
RUN mkdir /entrypoint.d

WORKDIR /workdir
COPY entrypoint.sh /

ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
CMD [""]
