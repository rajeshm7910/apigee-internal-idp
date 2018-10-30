#!/bin/sh
#
APIGEE_ROOT=/opt/apigee
cp -fr source/conf/routes.yaml $APIGEE_ROOT/edge-management-ui/source/conf/
/opt/apigee/apigee-service/bin/apigee-service edge-management-ui restart