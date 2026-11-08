#!/bin/sh
set -e
PORT=${PORT:-10000}
UUID=${UUID:-ad136eb0-80f0-4a42-995c-996a717a3e07}
WS_PATH=${WS_PATH:-/73291448c22611a1}
cat > /etc/xray/config.json <<EOF
{
  "inbounds": [{
    "port": $PORT,
    "listen": "0.0.0.0",
    "protocol": "vless",
    "settings": {"clients": [{"id": "$UUID"}], "decryption": "none"},
    "streamSettings": {"network": "ws", "wsSettings": {"path": "$WS_PATH"}}
  }],
  "outbounds": [{"protocol": "freedom"}]
}
EOF
exec /usr/local/bin/xray -config /etc/xray/config.json
