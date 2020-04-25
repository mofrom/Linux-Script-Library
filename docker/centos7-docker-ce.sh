#!/bin/bash
#### by Agony_O
clear
echo "测试环境：
		USER:root
  Operating System: CentOS Linux 7 (Core)
       CPE OS Name: cpe:/o:centos:centos:7
            Kernel: Linux 3.10.0-1062.el7.x86_64
      Architecture: x86-64"
sleep 5

# 依赖
yum install -y yum-utils device-mapper-persistent-data lvm2

# 源
echo "下载docker源中 ... "
wget -O /etc/yum.repos.d/docker-ce.repo https://download.docker.com/linux/centos/docker-ce.repo
sed -i 's+download.docker.com+mirrors.tuna.tsinghua.edu.cn/docker-ce+' /etc/yum.repos.d/docker-ce.repo
echo "下载华为Centos7源中 ... "
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.huaweicloud.com/repository/conf/CentOS-7-anon.repo

# 安装docker
yum makecache fast &&  yum -y install docker-ce

# 更换docker加速源
echo " 更换docker 加速源码 ... "
curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://f1361db2.m.daocloud.io
systemctl restart docker
echo " 安装成功，docker 版本 ：" `docker -v`
