#!/bin/bash
declare -a REQUIRED
declare -a OPTIONAL
## apigee-idp-tomcat tomcat related configuration variables
OPTIONAL+=(SSO_TOMCAT_KEYSTORE_FILEPATH)
OPTIONAL+=(SSO_TOMCAT_KEYSTORE_ALIAS)
OPTIONAL+=(SSO_TOMCAT_KEYSTORE_PASSWORD)
OPTIONAL+=(SSO_TOMCAT_PORT)
OPTIONAL+=(SSO_TOMCAT_PROXY_PORT)
SSO_TOMCAT_PORT_validate() {
  local PORT=$1
  local stat=1
  [[ -z "$PORT" ]] && return 1
  if [[ "$PORT" = *[[:digit:]]* ]]; then
    if [ "$PORT" -gt 1024 -a "$PORT" -le 65535 ]; then
     stat=0
    else
     echo -e "
     Sorry, running ${COMPONENT_NAME} with value for SSO_TOMCAT_PORT<=1024 requires root privileges which is not recommended.
     Please specify value for SSO_TOMCAT_PORT greater than 1024 and less that 65535.
     Make sure you don't have any port conflict with other services."
    fi
  fi
  return ${stat}
}
SSO_TOMCAT_PROXY_PORT_validate() {
  valid_port $1
}
SSO_TOMCAT_KEYSTORE_FILEPATH_validate() {
  valid_file "$1"
}
SSO_TOMCAT_KEYSTORE_ALIAS_validate() {
  [[ -n "$1" ]]
}
SSO_TOMCAT_KEYSTORE_PASSWORD_validate() {
  [[ -n "$1" ]]
}
~                                                                                                                                               
~                                                                                                                                               
~             
