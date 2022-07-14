FROM alpine:edge

ARG AUUID="08fbf438-c4fb-4375-9fc9-8b3a2550f6df"
ARG CADDYIndexPage="https://www.free-css.com/assets/files/free-css-templates/download/page176/garden-truck.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=8080

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
