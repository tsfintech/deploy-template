#!/bin/bash
BASEDIR=$(dirname "$0")

read -p "What is the name of the service?" SERVICE_NAME
sed -i -e "s/TEMPLATE_PROJECT_NAME/$SREVICE_NAME/g" bin/service-name config/logback-prod.xml config/wrapper.conf
mv bin/service-name bin/$SERVICE_NAME
mkdir logs
cd /etc/init.d && sudo ln -s $BASEDIR/bin/$SERVICE_NAME
