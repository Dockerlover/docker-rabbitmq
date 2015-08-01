# docker-rabbitmq
docker化Rabbitmq

## 镜像特点

- 2015/7/9 继承基础镜像docker-ubuntu

## 使用方法

- 获取代码并构建

        git clone https://github.com/Dockerlover/docker-rabbitmq.git
        cd docker-rabbitmq
        docker build -t docker-rabbitmq .

- 运行容器

        docker run -it -d --name rabbitmq --restart=always -p 15672:15672 -p 5672:5672 docker-rabbitmq
