FROM openjdk:17

MAINTAINER Jens Piegsa <piegsa@gmail.com>

ENV WILDFLY_VERSION  27.0.0.Final
ENV WILDFLY_SHA1     31106643002ae570444b4e30e376e27fff23cc2f
ENV JBOSS_HOME       /opt/wildfly

ADD run.sh /
ADD create_wildfly_admin_user.sh /

# Add the WildFly distribution to /opt, and make wildfly the owner of the extracted tar content
# Make sure the distribution is available from a well-known place
RUN cd $HOME \
    && curl -LOs https://github.com/wildfly/wildfly/releases/download/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz \
    && sha1sum wildfly-$WILDFLY_VERSION.tar.gz | grep $WILDFLY_SHA1 \
    && tar xf wildfly-$WILDFLY_VERSION.tar.gz \
    && mv $HOME/wildfly-$WILDFLY_VERSION $JBOSS_HOME \
    && rm wildfly-$WILDFLY_VERSION.tar.gz \
    && mkdir $JBOSS_HOME/standalone/data \
    && mkdir $JBOSS_HOME/standalone/log \
    && groupadd -r wildfly -g 433 \
    && useradd -u 431 -r -g wildfly -d $JBOSS_HOME -s /bin/false -c "WildFly user" wildfly \
    && chown wildfly:wildfly $JAVA_HOME/lib/security/cacerts \
    && chmod +x /create_wildfly_admin_user.sh /run.sh \
    && chown -R wildfly:wildfly $JBOSS_HOME/

# Ensure signals are forwarded to the JVM process correctly for graceful shutdown
ENV LAUNCH_JBOSS_IN_BACKGROUND true

EXPOSE 8080 9990 8443 9993 5005

USER wildfly

VOLUME $JBOSS_HOME/standalone/configuration
VOLUME $JBOSS_HOME/standalone/data
VOLUME $JBOSS_HOME/standalone/tmp
VOLUME $JBOSS_HOME/standalone/log

RUN ls -Ralph $JBOSS_HOME/standalone

CMD ["/run.sh"]
