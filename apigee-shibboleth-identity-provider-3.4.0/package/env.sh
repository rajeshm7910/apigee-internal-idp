#!/usr/bin/env bash
APPLICATION=shibbolethh-identity-provider
APIGEE_PREFIX=apigee-
REVERSE_ENGINEER_CONF_FOLDERS=
COMPONENT_ITERATION=${BUILD_NUMBER:-0}
APPLICATION_TYPE=commons
RUN_PACKAGE_VALIDATOR=false

SOURCE=${SOURCE:-${REMOTE_JENKINS_ARTIFACT_URL}/${JOB_NAME}/${BUILD_NUMBER}/${APPLICATION}.tar.gz}