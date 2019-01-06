#!/bin/sh
#
APIGEE_ROOT=/opt/apigee
MANAGEMEN_UI_FIX_DIST="https://raw.github.com/rajeshm7910/apigee-internal-idp/tree/master/dist/1.0.0/edge-management-ui.tar.gz"
#MANAGEMEN_UI_FIX_DIST="http://localhost:88/customrepo/edge-management-ui.tar.gz"

if [[ ! -d "/opt/apigee/edge-management-ui" ]] ; then
	echo "Edge Management UI not installed in this server"
	exit 1;
fi

su -m -c "curl -L $MANAGEMEN_UI_FIX_DIST | tar zx  --directory /opt/apigee" apigee

/opt/apigee/apigee-service/bin/apigee-service edge-management-ui restart
