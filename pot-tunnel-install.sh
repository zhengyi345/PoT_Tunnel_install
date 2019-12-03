#!/usr/bin/env bash

[ "$EUID" -ne '0' ] && echo "Error,This script must be run as root! " && exit 1

echo “开始执行PoT隧道脚本安装...”
wget  -N --no-check-certificate https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.13.4.linux-amd64.tar.gz && echo -n "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile && source /etc/profile
curl -L https://raw.githubusercontent.com/snail007/goproxy/master/install_auto.sh | bash
export GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct

echo “安装完成...”
