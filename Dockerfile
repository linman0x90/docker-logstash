# Logstash
#
# logstash is a tool for managing events and logs
#
# VERSION               1.4.2

FROM      dockerfile/java
MAINTAINER Lance Inman "linman0x90@gmail.com"

RUN apt-get update && apt-get install -y ca-certificates wget
RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz -O /tmp/logstash.tar.gz 2> /dev/null

RUN tar zxvf /tmp/logstash.tar.gz -C /opt && mv /opt/logstash-1.4.2 /opt/logstash && rm -rf /tmp/logstash.tar.gz

RUN [ -d /opt/certs ] || mkdir /opt/certs
RUN [ -f /opt/certs/logstash-forwarder.cr ] || openssl req -x509 -batch -nodes -newkey rsa:2048 -keyout /opt/certs/logstash-forwarder.key -out /opt/certs/logstash-forwarder.cr

VOLUME ["/opt/conf", "/opt/certs"]

EXPOSE 514
EXPOSE 5043
EXPOSE 9292

CMD /opt/logstash/bin/logstash agent -f /opt/conf/logstash.conf
