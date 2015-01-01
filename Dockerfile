# Logstash
#
# logstash is a tool for managing events and logs
#
# VERSION               1.4.2

FROM      dockerfile/java
MAINTAINER Lance Inman "linman0x90@gmail.com"

ENV LS_VER 1.4.2


#Install Logstash
RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-$LS_VER.tar.gz -O /tmp/logstash.tar.gz 2> /dev/null
RUN tar zxf /tmp/logstash.tar.gz -C /opt && mv /opt/logstash-$LS_VER /opt/logstash && rm -rf /tmp/logstash.tar.gz

COPY logstash.conf /opt/logstash/
COPY logstash.sh /usr/local/sbin/
RUN chmod +x /usr/local/sbin/logstash.sh


VOLUME ["/data"]

EXPOSE 514
EXPOSE 5043
EXPOSE 9292

CMD ["/usr/local/sbin/logstash.sh"]

