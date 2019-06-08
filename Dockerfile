FROM ubuntu:disco
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y librsvg2-bin

WORKDIR /ci
RUN groupadd -r cardboardci && useradd --no-log-init -r -g cardboardci cardboardci
USER cardboardci