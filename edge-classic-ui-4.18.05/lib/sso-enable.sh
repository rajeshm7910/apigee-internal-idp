#!/bin/bash
declare -a REQUIRED
declare -a OPTIONAL

REQUIRED+=(SSO_PUBLIC_URL_HOSTNAME)
REQUIRED+=(SSO_PUBLIC_URL_SCHEME)
REQUIRED+=(SSO_PUBLIC_URL_PORT)
REQUIRED+=(SSO_ADMIN_NAME)
REQUIRED+=(SSO_ADMIN_SECRET)
OPTIONAL+=(EDGEUI_SSO_CLIENT_NAME)
REQUIRED+=(EDGEUI_SSO_CLIENT_SECRET)
REQUIRED+=(EDGEUI_SSO_REGISTERD_PUBLIC_URIS)

SSO_PUBLIC_URL_HOSTNAME_validate() {
   [[ -n "$1" ]]
}

SSO_PUBLIC_URL_SCHEME_validate() {
   [[ -n "$1" ]]
}

SSO_PUBLIC_URL_PORT_validate() {
   valid_port "$1"
}

SSO_ADMIN_NAME_validate(){
   [[ -n "$1" ]]
}

SSO_ADMIN_SECRET_validate() {
   [[ -n "$1" ]]
}

EDGEUI_SSO_CLIENT_NAME_validate() {
   [[ -n "$1" ]]
}

EDGEUI_SSO_CLIENT_SECRET_validate() {
   [[ -n "$1" ]]
}

EDGEUI_SSO_REGISTERD_PUBLIC_URIS_validate(){
   [[ -n "$1" ]]
}