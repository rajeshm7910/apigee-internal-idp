#!/bin/bash

export working_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APPLICATION=internal-idp

tar -C ${working_dir}/ --exclude='*.tar.gz' --exclude='./package.sh' --exclude='.git*' -zvcf /var/tmp/${APPLICATION}.tar.gz .

if [ $? -ne 0 ]; then
   echo "Error while creating application tar ball";
   exit 1
fi

mv /var/tmp/${APPLICATION}.tar.gz ${working_dir}/

[ -f ${working_dir}/package/env.sh ] && source ${working_dir}/package/env.sh
