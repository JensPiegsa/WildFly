#!/bin/bash

if [ ! -f /opt/.wildfly_admin_created ]; then
  /create_wildfly_admin_user.sh
fi

exec /opt/wildfly/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
