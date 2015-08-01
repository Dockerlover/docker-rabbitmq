#!/bin/bash

if [ -f /.rabbitmq_password_set ]; then
	echo "RabbitMQ password already set!"
	exit 0
fi

_word=$( [ ${RABBITMQ_PASS} ] && echo "preset" || echo "random" )
echo "=> Securing RabbitMQ with a ${_word} password"
cat > /etc/rabbitmq/rabbitmq.config <<EOF
[
	{rabbit, [{default_user, <<"${RABBITMQ_USER}">>},{default_pass, <<"${RABBITMQ_PASS}">>},{tcp_listeners, [{"0.0.0.0", 5672}]}]}
].
EOF

echo "=> Done!"
touch /.rabbitmq_password_set

echo "========================================================================"
echo "You can now connect to this RabbitMQ server using, for example:"
echo ""
echo "    curl --user ${RABBITMQ_USER}:${RABBITMQ_PASS} http://<host>:<port>/api/vhosts"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
