#!/bin/sh
echo '下载mysql8.0镜像'
docker pull mysql:8.0.20
echo '启动mysql镜像'
docker run -p 3306:3306 --name mysql -e MYSQL_ROOT_PASSWORD=123456  -d mysql:8.0.20
echo '拷贝容器内的文件'
docker cp  mysql:/etc/mysql /home/docker/mysql8.0.20
echo '删除容器'
docker rm -f  mysql
echo '启动mysql8.0'
docker run \
-p 3306:3306 \
--name mysql \
--privileged=true \
--restart unless-stopped \
-v /mnt/sda1/mysql8.0.20/mysql:/etc/mysql \
-v /mnt/sda1/mysql8.0.20/logs:/logs \
-v /mnt/sda1/mysql8.0.20/data:/var/lib/mysql \
-v /etc/localtime:/etc/localtime \
-e MYSQL_ROOT_PASSWORD=123456 \
-d mysql:8.0.20
