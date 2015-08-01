# 基础镜像
FROM docker-ubuntu
# 维护人员
MAINTAINER liuhong1.happy@163.com
# 添加环境变量
ENV USER_NAME admin
ENV SERVICE_ID rabbitmq
ENV RABBITMQ_USER admin
ENV RABBITMQ_PASS testpass

# 安装RabbitMQ
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F7B8CEA6056E8E56 && \
    echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y rabbitmq-server && \
    rabbitmq-plugins enable rabbitmq_management && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo "ERLANGCOOKIE" > /var/lib/rabbitmq/.erlang.cookie
RUN chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
RUN chmod 400 /var/lib/rabbitmq/.erlang.cookie
RUN chown -R rabbitmq:rabbitmq /var/lib/rabbitmq
# 添加脚本
COPY set_rabbitmq_password.sh /set_rabbitmq_password.sh
# 声明可执行脚本,并执行脚本
RUN chmod +x /*.sh 
RUN ./set_rabbitmq_password.sh
# 暴露默认端口
EXPOSE 5672 15672
# 配置supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# 启动supervisord
CMD ["/usr/bin/supervisord"]
