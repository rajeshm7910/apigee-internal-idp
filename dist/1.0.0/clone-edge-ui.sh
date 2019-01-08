#!/bin/bash

APIGEE_ROOT=/opt/apigee
#EDGE_UI_CLONE_FIX="https://raw.github.com/rajeshm7910/apigee-internal-idp/tree/master/dist/1.0.0/edge-classic-ui-clone.tar.gz"
EDGE_UI_CLONE="http://localhost:88/customrepo/edge-classic-ui-clone.tar.gz"
PORT=${1:-9098}

echo "Setting edge-classic ui on port : " $PORT
source $APIGEE_ROOT/etc/defaults.sh
if [[ ! -d "/opt/apigee/edge-ui" ]] ; then
        echo "Edge  UI not installed in this server"
        exit 1;
fi

su -m -c "mkdir -p $APIGEE_ROOT/edge-classic-ui-4.18.05-0.0.0" apigee
su -m -c "cp -fr $APIGEE_ROOT/edge-ui/* $APIGEE_ROOT/edge-classic-ui-4.18.05-0.0.0/" apigee
su -m -c "ln -s $APIGEE_ROOT/edge-classic-ui-4.18.05-0.0.0 $APIGEE_ROOT/edge-classic-ui" apigee

su -m -c "curl -L $EDGE_UI_CLONE | tar xz  -C  /opt/apigee/edge-classic-ui/" apigee
su -m -c "sed -i.bak s/9098/$PORT/g /opt/apigee/edge-classic-ui/lib/settings" apigee
