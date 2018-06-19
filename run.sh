#!/bin/bash

if [ ! -f /opt/.wildfly_admin_created ]; then
  /create_wildfly_admin_user.sh
fi

if  [ -f /opt/wildfly/ADMIN_ONLY_MODE ]; then
  ADMIN_ONLY_MODE_FLAG=--admin-only
  rm /opt/wildfly/ADMIN_ONLY_MODE
fi

exec /opt/wildfly/bin/standalone.sh -Dee8.preview.mode=true -b=0.0.0.0 -bmanagement=0.0.0.0 $ADMIN_ONLY_MODE_FLAG
