FROM alpine:3.19.1

LABEL org.label-schema.description="puppet-lint Docker Image" \
      org.label-schema.name="puppet-lint" \
      org.label-schema.version="4.2.4" \
      org.label-schema.schema-version="1.0" \
      org.label-schema.vcs-url="https://github.com/evolvedbinary/docker-puppet-lint" \
      org.label-schema.vendor="Evolved Binary"

# update Alpine with latest versions
RUN apk update \
  && apk upgrade

# install CA certificates and OpenSSL
RUN apk add ca-certificates \
  openssl \
  openssl-dev

# install build tools and Ruby
RUN apk add \
  build-base \
  libffi \
  libffi-dev \
  readline \
  readline-dev \
  yaml \
  yaml-dev \
  zlib \
  zlib-dev \
  coreutils \
  file \
  make \
  automake \
  autoconf \
  cmake \
  ruby \
  ruby-dev

# update Gem and installed gems
RUN gem update --system --no-document \
  && gem install readline-ext --no-document \
  && gem update --no-document \
  && gem cleanup

# install puppet-lint
RUN gem install puppet-lint:4.2.4 \
  puppet-lint-strict_indent-check:3.0.0

# cleanup apk
RUN rm -rf /var/cache/apk/*

VOLUME /puppet
WORKDIR /puppet
ENV HOME /puppet

ENTRYPOINT ["puppet-lint"]

