FROM ubuntu:disco

COPY provision/pkglist /cardboardci/pkglist
RUN apt-get update \
    && xargs -a /cardboardci/pkglist apt-get install --no-install-recommends -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ci
RUN groupadd -r cardboardci && useradd --no-log-init -r -g cardboardci cardboardci
USER cardboardci

LABEL org.label-schema.vendor = "CardboardCI"