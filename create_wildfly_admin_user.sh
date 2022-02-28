#!/bin/bash

if [ -f /opt/wildfly/.wildfly_admin_created ]; then
  echo "The WildFly 'admin' user already exists."
  exit 0
fi

#generate password
echo "=> Creating the WildFly user 'admin'."
/opt/wildfly/bin/add-user.sh admin ${WILDFLY_PASS} --silent
echo "=> Done!"
touch /opt/wildfly/.wildfly_admin_created
