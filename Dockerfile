FROM piegsaj/oracle-jre:latest

MAINTAINER Jens Piegsa <piegsa@gmail.com>

ENV WILDFLY_VERSION 10.0.0.Beta1
ENV JBOSS_HOME      /opt/wildfly

ADD run.sh /
ADD create_wildfly_admin_user.sh /
       
RUN chmod +x /create_wildfly_admin_user.sh /run.sh && \
    cd /opt && \
    wget http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz && \
    tar xvf wildfly-$WILDFLY_VERSION.tar.gz && \
    rm wildfly-$WILDFLY_VERSION.tar.gz && \
    ln -s /opt/wildfly-$WILDFLY_VERSION $JBOSS_HOME && \
    groupadd -r wildfly -g 433 && \
    useradd -u 431 -r -g wildfly -d $JBOSS_HOME -s /bin/false -c "WildFly user" wildfly && \
    chown -R wildfly:wildfly $JBOSS_HOME

EXPOSE 8080 9990

USER wildfly

CMD ["/run.sh"]
