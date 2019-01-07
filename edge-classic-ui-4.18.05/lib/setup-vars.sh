#!/bin/bash
declare -a REQUIRED
declare -a OPTIONAL

REQUIRED+=(ADMIN_EMAIL)
REQUIRED+=(SMTPMAILFROM)

OPTIONAL+=(SKIP_SMTP)
OPTIONAL+=(APIGEE_ADMINPW)
OPTIONAL+=(SMTPHOST)
OPTIONAL+=(SMTPPORT)
OPTIONAL+=(SMTPSSL)
OPTIONAL+=(SMTPUSER)
OPTIONAL+=(SMTPPASSWORD)
OPTIONAL+=(SMTPSTARTTLS)
OPTIONAL+=(EDGEUI_ENABLE_UNIFIED_UI)

SKIP_SMTP_validate(){
 valid_yn "$1"
}

SMTPHOST_validate(){
  [[ -z "$1" ]] && return 1
  return 0
}

SMTPPORT_validate(){
  valid_port "$1"
}

SMTPSSL_validate(){
  valid_yn "$1"
}

SMTPSTARTTLS_validate(){
  valid_yn "$1"
}

SMTPUSER_validate(){
  [[ -z "$1" ]] && return 1
  return 0
}

SMTPPASSWORD_validate(){
  [[ -z "$1" ]] && return 1
  return 0
}

SMTPMAILFROM_validate(){
    valid_email "$1"
}

EDGEUI_ENABLE_UNIFIED_UI_validate(){
   valid_yn "$1"
}