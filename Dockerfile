FROM piegsaj/oracle-jre:latest

MAINTAINER Jens Piegsa <piegsa@gmail.com>

ENV WILDFLY_VERSION 10.0.0.CR4
ENV JBOSS_HOME      /opt/wildfly
ENV BUILD_PACKAGES  curl

ADD run.sh /
ADD create_wildfly_admin_user.sh /
       
RUN apt-get update && apt-get install -y $BUILD_PACKAGES --no-install-recommends && apt-get clean -qq && \
    curl -Ls "http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz" \
    | tar -xzC /opt --no-same-owner && \
    apt-get remove -qq --purge -y $BUILD_PACKAGES $(apt-mark showauto) && rm -rf /var/lib/apt/lists/* && \
    
    ln -s /opt/wildfly-$WILDFLY_VERSION $JBOSS_HOME && \
    groupadd -r wildfly -g 433 && \
    useradd -u 431 -r -g wildfly -d $JBOSS_HOME -s /bin/false -c "WildFly user" wildfly && \
    chmod +x /create_wildfly_admin_user.sh /run.sh && \
    chown -R wildfly:wildfly /opt/wildfly*

EXPOSE 8080 9990

USER wildfly

CMD ["/run.sh"]
