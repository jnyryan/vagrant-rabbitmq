#!/bin/bash

####################
# Prerequisites
apt-get update
apt-get install -y make curl git

#####################
# Install RabbitMQ

cp /vagrant/etc/rabbitmq-signing-key-public.asc /tmp/rabbitmq-signing-key-public.asc
apt-key add /tmp/rabbitmq-signing-key-public.asc

echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list
apt-get -qq update > /dev/null
apt-get -qq -y install rabbitmq-server > /dev/null
/usr/sbin/rabbitmq-plugins enable rabbitmq_management
echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config


/etc/init.d/rabbitmq-server restart
