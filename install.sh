#!/usr/bin/env bash 

##
## install redis 3.0.0
##


## create redis user
groupadd -r redis && useradd -r -g redis redis

yum install -y wget tar make gcc
wget http://download.redis.io/releases/redis-3.0.0.tar.gz
tar -zxf redis-3.0.0.tar.gz 
cd redis-3.0.0 && make && make install 
cp src/redis-cli src/redis-server /usr/sbin/
mkdir -p /usr/local/redis/{conf,bin,logs,var}
chown -R redis:redis /usr/local/redis
yum clean all && rm -rf redis-3.0.0.tar.gz
