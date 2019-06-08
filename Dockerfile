FROM alpine:3.8
RUN apk add --update --no-cache librsvg=2.40.20-r0

WORKDIR /ci
RUN addgroup -S cardboardci && adduser -S -G cardboardci cardboardci
USER cardboardci