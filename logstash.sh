#!/bin/bash

[ -d /data/conf ] || mkdir /data/conf
[ -f /data/conf/logstash.conf ] || cp /opt/logstash/logstash.conf /data/conf/

[ -d /data/certs ] || mkdir /data/certs
[ -f /data/certs/logstash-forwarder.crt ] || openssl req -x509 -batch -nodes -newkey rsa:2048 -keyout /data/certs/logstash-forwarder.key -out /data/certs/logstash-forwarder.crt

/opt/logstash/bin/logstash agent -f /data/conf/logstash.conf -- web


