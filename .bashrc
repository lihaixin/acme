#!/bin/bash

if [ -t 1 ]; then
	export PS1="\e[1;34m[\e[1;33m\u@\e[1;32mD-\h\e[1;37m:\w\[\e[1;34m]\e[1;36m\\$ \e[0m"
fi

if [ -f "/etc/envfile" ]; then
export $(grep -v '^#' /etc/envfile | xargs)
fi

if [ "$HTTP_PROXY" != "" ]; then
export http_proxy=$HTTP_PROXY
export https_proxy=$http_proxy
fi

# Aliases
alias l='ls -lAsh --color'
alias ls='ls -C1 --color'
alias cp='cp -ip'
alias rm='rm -i'
alias mv='mv -i'
alias tmux='tmux -u'
alias h='cd ~;clear;'

alias speed='time curl -o /dev/null http://cachefly.cachefly.net/100mb.test'
alias speedcn='time curl -o /dev/null http://dldir1.qq.com/qqfile/qq/QQ9.0.8/24201/QQ9.0.8.24201.exe'
alias acmereboot='pkill -s 1;sleep 1;pkill -s 1'
alias reboot='pkill -s 1;sleep 1;pkill -s 1'

IP=$(curl -s  ip.sb)
: ${MainINF:=$(ip route | grep "default via" |awk '{ print $5}')}
: ${MainIP:=$(/sbin/ifconfig $MainINF | grep 'inet' | awk '{ print $2}' | awk -F ":" '{print $2 }' | head -n 1)}

echo -e -n '\E[1;34m'
figlet -k -f big -c -m-1 -w 120 "Welcome `hostname`"
echo " # -------------------------------------------------------------------------------------------------------------- #"
if [ -f "/etc/member" ]; then
MEMBER=`cat /etc/member`
if [ "$MEMBER" == "0" ]; then
echo " # `cat /etc/npsnotice` "
else
echo " # 容器ID： `cat /etc/dockerid` "
fi
fi
echo -e " # $DOCKERID 容器支持各类域名提供商免费安装泛域名证书 "
echo -e " # $DOCKERID 容器默认已提供国内外常见的域名提供商证书申请"
echo -e " # 测试下载带宽:  使用< speed | speedcn > 重启程序:  使用< acmereboot >"
echo -e " # "
echo -e " # 更多信息访问网页查看： https://hub.docker.com/r/lihaixin/acme "

echo " # -------------------------------------------------------------------------------------------------------------- #"
if [ -f "/etc/expired" ]; then
/usr/bin/member.sh
fi
echo -e -n '\E[1;34m'
echo -e '\E[0m'
