FROM yydocker/centos:youyuan
MAINTAINER Colin <1209755822@qq.com>
# install redis
VOLUME ["/usr/local/redis/logs","/usr/local/redis/var"]
ADD install.sh /install
RUN /install
WORKDIR /usr/local/redis/conf/
ADD redis.conf /etc/redis.conf
ADD sysctl.conf /etc/sysctl.conf
EXPOSE 6379
ENTRYPOINT  ["/usr/sbin/redis-server"]
CMD  ["/etc/redis.conf"]
