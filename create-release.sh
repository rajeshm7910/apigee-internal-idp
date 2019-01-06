#!/bin/bash

bump_version() {
  base_string=$(cat version.txt)
  echo $build_string
  base_list=(`echo $base_string | tr '.' ' '`)
  v_major=${base_list[0]}
  v_minor=${base_list[1]}
  v_patch=${base_list[2]}
  v_patch=$((v_patch + 1))
  suggested_version="$v_major.$v_minor.$v_patch"
  echo $suggested_version > version.txt 
  ITERATION=$suggested_version
}

bump_version

su -m -c "ln -s apigee-shibboleth-identity-provider-3.4.0 apigee-shibboleth-identity-provider" apigee
su -m -c "fpm -s dir -t rpm -a noarch -n apigee-shibboleth-identity-provider --version 3.4.0 --iteration ${ITERATION} --rpm-use-file-permissions --prefix /opt/apigee/ --directories ./apigee-shibboleth-identity-provider-3.4.0 apigee-shibboleth-identity-provider-3.4.0 apigee-shibboleth-identity-provider" apigee

su -m -c "ln -s apigee-tomcat-idp-8.5.37 apigee-tomcat-idp" apigee
su -m -c "fpm -s dir -t rpm -a noarch -n apigee-tomcat-idp --version 8.5.37 --iteration ${ITERATION} --rpm-use-file-permissions --prefix /opt/apigee/ --directories ./apigee-tomcat-idp-8.5.37 apigee-tomcat-idp-8.5.37 apigee-tomcat-idp" apigee

su -m -c "ln -s apigee-internal-idp-1.0.0 apigee-internal-idp" apigee
su -m -c "fpm -s dir -t rpm -a noarch -n apigee-internal-idp --version 1.0.0 --iteration ${ITERATION} -d apigee-tomcat-idp -d apigee-shibboleth-identity-provider --rpm-use-file-permissions --prefix /opt/apigee/ --directories ./apigee-internal-idp-1.0.0 apigee-internal-idp-1.0.0 apigee-internal-idp" apigee

rm -fr dist/1.0.0/*
mv *.rpm dist/1.0.0/
#targz the edge-management-ui
su -m -c "tar czf ./dist/1.0.0/edge-management-ui.tar.gz edge-management-ui/" apigee
su -m -c "cp -fr fix-ue-routes.sh dist/1.0.0/" apigee
su -m -c "createrepo dist/1.0.0/" apigee
unlink apigee-shibboleth-identity-provider
unlink apigee-tomcat-idp
unlink apigee-internal-idp
