#!/bin/bash

if [ -t 1 ]; then
	export PS1="\e[1;34m[\e[1;33m\u@\e[1;32mD-\h\e[1;37m:\w\[\e[1;34m]\e[1;36m\\$ \e[0m"
fi

if [ -f "/etc/envfile" ]; then
source /etc/envfile
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
echo " # `cat /tmp/npsnotice` "
echo " # 容器ID： `cat /etc/dockerid` "
echo " # "
echo " # 更多信息访问网页查看： https://hub.docker.com/r/lihaixin/acme "

echo " # -------------------------------------------------------------------------------------------------------------- #"
if [ -f "/etc/tty" ]; then
/usr/bin/tty_server.sh
fi
echo -e -n '\E[1;34m'
echo -e '\E[0m'
