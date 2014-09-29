#!/bin/bash

if [ -f /.wildfly_admin_created ]; then
  echo "The WildFly 'admin' user has already been created."
  exit 0
fi

#generate password
PASS = ${WILDFLY_PASS:-$(pwgen -s 12 1)}
_type = $( [ ${WILDFLY_PASS} ] && echo "preset" || echo "random" )
echo "=> Creating the WildFly user 'admin' with the ${_type} password '${PASS}'."
/opt/wildfly/bin/add-user.sh admin ${WILDFLY_PASS} --silent
echo "=> Done!"
touch /.wildfly_admin_created
echo "========================================================================"
echo "You can now configure to this WildFly server using:"
echo ""
echo " admin:${PASS}"
echo ""
echo "========================================================================"
