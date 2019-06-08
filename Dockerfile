FROM ubuntu:disco
RUN apt-get update \
    && apt-get install --no-install-recommends -y librsvg2-bin \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ci
RUN groupadd -r cardboardci && useradd --no-log-init -r -g cardboardci cardboardci
USER cardboardci