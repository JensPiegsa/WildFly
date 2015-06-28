FROM ubuntu:15.10
MAINTAINER Jens Piegsa <piegsa@gmail.com>

RUN apt-get update && \
    apt-get install software-properties-common python-software-properties -y && \
    add-apt-repository ppa:webupd8team/java && \
    apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install oracle-java8-set-default oracle-java8-installer -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
# Set the WILDFLY_VERSION env variable
ENV WILDFLY_VERSION 9.0.0.CR2

# Add the WildFly distribution to /opt
RUN cd /opt && wget http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz 
RUN cd /opt && tar xvf wildfly-$WILDFLY_VERSION.tar.gz && rm wildfly-$WILDFLY_VERSION.tar.gz

# Make sure the distribution is available from a well-known place
RUN ln -s /opt/wildfly-$WILDFLY_VERSION /opt/wildfly

# Set the JBOSS_HOME env variable
ENV JBOSS_HOME /opt/wildfly

# Create the wildfly user and group
RUN groupadd -r wildfly -g 433 && useradd -u 431 -r -g wildfly -d /opt/wildfly -s /bin/false -c "WildFly user" wildfly

# Change the owner of the /opt/wildfly directory
RUN chown -R wildfly:wildfly /opt/wildfly*

ADD create_wildfly_admin_user.sh /create_wildfly_admin_user.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

# Expose the ports we're interested in
EXPOSE 8080 9990

# Run everything below as the wildfly user
USER wildfly

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface
CMD ["/run.sh"]
