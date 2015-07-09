# docker-rabbitmq
docker化Rabbitmq

## 镜像特点

- 2015/6/21 继承基础镜像docker-register，自身具备服务注册功能

## 使用方法

- 获取代码并构建

        git clone https://github.com/Dockerlover/docker-rabbitmq.git
        cd docker-rabbitmq
        docker build -t docker-rabbitmq .

- 运行容器

        docker -it -d --name rabbitmq --restart=always -p 15672:15672 -p 5672:5672 docker-rabbitmq
