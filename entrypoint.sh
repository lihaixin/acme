#!/bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

install_cert() {
mkdir -p /etc/cert/$DOMAIN
curl https://get.acme.sh | sh
~/.acme.sh/acme.sh --set-default-ca  --server  letsencrypt
~/.acme.sh/acme.sh  --debug --issue --dns dns_cf -d $DOMAIN -d *.$DOMAIN --key-file /etc/cert/$DOMAIN/private.key --fullchain-file /etc/cert/$DOMAIN/fullchain.crt
~/.acme.sh/acme.sh --upgrade --auto-upgrade
}

# 查看证书，没有就自动创建
if [ ! -f "/etc/cert/$DOMAIN/fullchain.crt" ]; then
  install_cert
fi
while true; do sleep 1; done;
