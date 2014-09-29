FROM silenttroll/wildfly-java-8

ADD create_wildfly_admin_user.sh /create_wildfly_admin_user.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

CMD ["/run.sh"]
