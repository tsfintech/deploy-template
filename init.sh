#!/bin/bash

read -p "What is the name of the service?" service_name
sed -i -e "s/TEMPLATE_PROJECT_NAME/$service_name/g" bin/service-name config/logback-prod.xml config/wrapper.conf
mv bin/service-name bin/$service_name
mkdir logs
