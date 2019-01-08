#!/bin/bash
declare -a REQUIRED
declare -a OPTIONAL

OPTIONAL+=(HTTPSPORT)
OPTIONAL+=(DISABLE_HTTP)
OPTIONAL+=(KEY_ALGO)
OPTIONAL+=(KEY_FILE_PATH)
OPTIONAL+=(KEY_PASS)
OPTIONAL+=(EDGEUI_SELF_SIGNED_CERT_PATH)

HTTPSPORT_validate(){
  valid_port "$1"
}

DISABLE_HTTP_validate(){
  valid_yn "$1"
}

KEY_ALGO_validate(){
  [[ -z "$1" ]] && return 1
  return 0
}

KEY_FILE_PATH_validate(){
  valid_file "$1"
}

KEY_PASS_validate(){
  [[ -z "$1" ]] && return 1
  return 0
}

EDGEUI_SELF_SIGNED_CERT_PATH_validate(){
  valid_file "$1"
}