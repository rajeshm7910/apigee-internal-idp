#/bin/bash
#This scripts downloads the latest version of tomcat and install under ${APIGEE_ROOT} directories
APIGEE_ROOT=/opt/apigee
TOMCAT_VERSION=8.5.37
SHIBBOLETH_VERSION=3.4.0
source lib/apigee-env.sh
source ${APIGEE_ROOT}/etc/defaults.sh

install_tomcat() {
su -m -c "curl -o ${APIGEE_ROOT}/apache-tomcat-${TOMCAT_VERSION}.tar.gz https://www-us.apache.org/dist/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" $RUN_USER

su -m -c "tar -xvf ${APIGEE_ROOT}/apache-tomcat-${TOMCAT_VERSION}.tar.gz -C ${APIGEE_ROOT}/" $RUN_USER
su -m -c "rm -fr ${APIGEE_ROOT}/apache-tomcat-${TOMCAT_VERSION}.tar.gz" $RUN_USER
su -m -c "mv ${APIGEE_ROOT}/apache-tomcat-${TOMCAT_VERSION} ${APIGEE_ROOT}/apigee-tomcat-idp-${TOMCAT_VERSION}" $RUN_USER
su -m -c "touch ${APIGEE_ROOT}/apigee-tomcat-idp-${TOMCAT_VERSION}/lib/settings" $RUN_USER
su -m -c "ln -s ${APIGEE_ROOT}/apigee-tomcat-idp-${TOMCAT_VERSION}  ${APIGEE_ROOT}/apigee-tomcat-idp" $RUN_USER
}

install_shibboleth() {

su -m -c "curl -o ${APIGEE_ROOT}/shibboleth-identity-provider-${SHIBBOLETH_VERSION}.tar.gz https://shibboleth.net/downloads/identity-provider/${SHIBBOLETH_VERSION}/shibboleth-identity-provider-${SHIBBOLETH_VERSION}.tar.gz" $RUN_USER
su -m -c "tar -xvf ${APIGEE_ROOT}/shibboleth-identity-provider-${SHIBBOLETH_VERSION}.tar.gz -C ${APIGEE_ROOT}/" $RUN_USER
su -m -c "rm -fr ${APIGEE_ROOT}/shibboleth-identity-provider-${SHIBBOLETH_VERSION}.tar.gz" $RUN_USER
su -m -c "mv ${APIGEE_ROOT}/shibboleth-identity-provider-${SHIBBOLETH_VERSION} ${APIGEE_ROOT}/apigee-shibboleth-identity-provider-${SHIBBOLETH_VERSION}" $RUN_USER

}

install_tomcat
install_shibboleth
