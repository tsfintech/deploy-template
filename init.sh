#!/bin/bash
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

read -p "What is the name of the service?" SERVICE_NAME
sed -i -e "s/TEMPLATE_PROJECT_NAME/$SERVICE_NAME/g" bin/service-name config/logback-prod.xml config/wrapper.conf
mv bin/service-name bin/$SERVICE_NAME
mkdir logs
cd /etc/init.d && sudo ln -s $BASEDIR/bin/$SERVICE_NAME
