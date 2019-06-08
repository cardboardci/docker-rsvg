FROM ubuntu:disco

COPY provision/pkglist /cardboardci/pkglist
RUN apt-get update \
    && xargs -a /cardboardci/pkglist apt-get install --no-install-recommends -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ci
RUN groupadd -r cardboardci && useradd --no-log-init -r -g cardboardci cardboardci
USER cardboardci


LABEL maintainer="jrbeverly" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.summary="Rasterize SVGs." \
    org.label-schema.description="Turn SVG files into raster images." \
    org.label-schema.vendor="cardboardci" \
    org.label-schema.architecture="amd64" \
    org.label-schema.url="https://gitlab.com/cardboardci/images/rsvg" \
    org.label-schema.changelog-url="https://gitlab.com/cardboardci/images/rsvg/releases" \
    org.label-schema.authoritative-source-url="https://cloud.docker.com/u/cardboardci/repository/docker/cardboardci/rsvg" \
    org.label-schema.distribution-scope="public" \
    org.label-schema.vcs-type="git"