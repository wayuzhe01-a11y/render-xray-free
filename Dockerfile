FROM alpine:3.20
RUN apk add --no-cache ca-certificates curl unzip
RUN mkdir -p /usr/local/bin /etc/xray && curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/download/v26.10.31/Xray-linux-64.zip && unzip /tmp/xray.zip -d /usr/local/bin/ && chmod +x /usr/local/bin/xray && rm /tmp/xray.zip
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
