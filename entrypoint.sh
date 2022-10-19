#!/bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH;ntp

if [ -f "/etc/envfile" ]; then
export $(grep -v '^#' /etc/envfile | xargs)
fi

if [ "$HTTP_PROXY" != "" ]; then
export http_proxy=$HTTP_PROXY
export https_proxy=$http_proxy
fi

install_cert() {
mkdir -p /etc/cert/$DOMAIN
curl https://get.acme.sh | sh

: ${TYPE:=zerossl}

if [ "$TYPE" == "letsencrypt" ]; then
~/.acme.sh/acme.sh --set-default-ca  --server  letsencrypt
if

if [ "$TYPE" == "zerossl" ]; then
~/.acme.sh/acme.sh --register-account -m $ID
if

if [ "$DNS" == "dns_cf" ]; then
  : ${CF_Email:=$ID}
  : ${CF_Key:=$KEY}
  if [ "$aliasDOMAIN" == ""]; then
  ~/.acme.sh/acme.sh  --debug --issue --dns $DNS -d $DOMAIN -d *.$DOMAIN --key-file /etc/cert/$DOMAIN/private.key --fullchain-file /etc/cert/$DOMAIN/fullchain.crt
  ~/.acme.sh/acme.sh --upgrade --auto-upgrade
  else
  ~/.acme.sh/acme.sh  --debug --issue --dns $DNS -d $DOMAIN -d *.$DOMAIN --challenge-alias $aliasDOMAIN --key-file /etc/cert/$DOMAIN/private.key --fullchain-file /etc/cert/$DOMAIN/fullchain.crt
  ~/.acme.sh/acme.sh --upgrade --auto-upgrade
  fi
fi


if [ "$DNS" == "dns_namecom" ]; then
: ${Namecom_Username:=$ID}
: ${Namecom_Token:=$KEY}
~/.acme.sh/acme.sh  --debug --issue --dns $DNS  -d $DOMAIN -d *.$DOMAIN --key-file /etc/cert/$DOMAIN/private.key --fullchain-file /etc/cert/$DOMAIN/fullchain.crt
~/.acme.sh/acme.sh --upgrade --auto-upgrade
fi

if [ "$DNS" == "dns_gd" ]; then
: ${GD_Key:=$ID}
: ${GD_Secret:=$KEY}
~/.acme.sh/acme.sh  --debug --issue --dns $DNS  -d $DOMAIN -d *.$DOMAIN --key-file /etc/cert/$DOMAIN/private.key --fullchain-file /etc/cert/$DOMAIN/fullchain.crt
~/.acme.sh/acme.sh --upgrade --auto-upgrade
fi

if [ "$DNS" == "dns_namesilo" ]; then
: ${Namesilo_Key:=$KEY}
~/.acme.sh/acme.sh  --debug --issue --dns $DNS --dnssleep 900 -d $DOMAIN -d *.$DOMAIN --key-file /etc/cert/$DOMAIN/private.key --fullchain-file /etc/cert/$DOMAIN/fullchain.crt
~/.acme.sh/acme.sh --upgrade --auto-upgrade
fi

if [ "$DNS" == "dns_dp" ]; then
: ${DP_Id:=$ID}
: ${DP_Key:=$KEY}
~/.acme.sh/acme.sh  --debug --issue --dns $DNS -d $DOMAIN -d *.$DOMAIN --key-file /etc/cert/$DOMAIN/private.key --fullchain-file /etc/cert/$DOMAIN/fullchain.crt
~/.acme.sh/acme.sh --upgrade --auto-upgrade
fi

if [ "$DNS" == "dns_ali" ]; then
: ${Ali_Key:=$ID}
: ${Ali_Secret:=$KEY}
~/.acme.sh/acme.sh  --debug --issue --dns $DNS -d $DOMAIN -d *.$DOMAIN --key-file /etc/cert/$DOMAIN/private.key --fullchain-file /etc/cert/$DOMAIN/fullchain.crt
~/.acme.sh/acme.sh --upgrade --auto-upgrade
fi

if [ "$DNS" == "" ]; then
  if [ "$DOMAIN" != "" ]; then
  ~/.acme.sh/acme.sh  --debug --issue  -d $DOMAIN --standalone
  ~/.acme.sh/acme.sh --installcert -d $DOMAIN --key-file /etc/cert/$DOMAIN/private.key --fullchain-file /etc/cert/$DOMAIN/fullchain.crt
  ~/.acme.sh/acme.sh --upgrade --auto-upgrade
  fi
fi
}

# 查看证书，没有就自动创建
if [ ! -f "/etc/cert/$DOMAIN/fullchain.crt" ]; then
 # install_cert
fi
crond
while true; do sleep 1; done;
