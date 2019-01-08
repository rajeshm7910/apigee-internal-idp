#!/bin/bash
declare -a REQUIRED

REQUIRED+=(EDGEUI_SSO_ENABLED)

EDGEUI_SSO_ENABLED_validate() {
   valid_yn "$1"
}