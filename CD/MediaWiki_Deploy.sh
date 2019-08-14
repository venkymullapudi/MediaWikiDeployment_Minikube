#!/bin/bash
#This will run a Kubectl command on a yaml file(in github repository), the yaml will fetch
#an image from Private Docker Registry,
#Deploy the MediaWiki Service
#Update the nginx proxy

if [[  -z `kubectl get namespaces | awk '{print $1}' | grep -w LAMP_Application` ]]
then
  kubectl create namespace lamp-application
fi
