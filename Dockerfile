FROM sillenttroll/wildfly-java-8

MAINTAINER Jens Piegsa <piegsa@gmail.com>

USER root

ADD create_wildfly_admin_user.sh /create_wildfly_admin_user.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

USER wildfly

CMD ["/run.sh"]
