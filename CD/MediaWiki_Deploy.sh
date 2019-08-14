#!/bin/bash
#This will run a Kubectl command on a yaml file(in github repository), the yaml will fetch
#an image from Private Docker Registry,
#Deploy the MediaWiki Service
#Update the nginx proxy

#Variables
NAMESPACE="lamp-application"
APP="mediawiki"
DB="mysql"
MEDIAWIKIYAML="https://github.com/venkymullapudi/MediaWikiDeployment_TW/blob/master/CD/mediawiki.yaml"
MYSQLYAML="https://github.com/venkymullapudi/MediaWikiDeployment_TW/blob/master/CD/mysql.yaml"
APP_PORT="8090"
KUBECLUSTER="https://kubernetes.venky.corp:8443"
APP_HOSTING="http://mediawiki.venky.corp"
#NOTE: The above VIP mediawiki.venky.corp should exist for the Nginx host for the script to work
NGINX_CONF="/etc/nginx/nginx.conf"

#Create the namespace if it doesn't exist
if [[  -z `kubectl get namespaces | awk '{print $1}' | grep -w $NAMESPACE` ]]
then
  kubectl create namespace $NAMESPACE 
fi

#Create the mysql service if it does exist already, not doing PV/PVC here
if [[ -z `kubectl get svc -n $NAMESPACE | grep -i $DB` ]]
then
 wget $MYSQLYAML 
 kubectl apply -f ${DB}.yaml -n $NAMESPACE
fi

# Updating the mediawiki application
wget $MEDIAWIKIYAML
kubectl apply -f ${APP}.yaml -n $NAMESPACE

#Updating the nginx ingress
echo "
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: ${APP}
  annotations:
    nginx.ingress.kubernetes.io/ssl-redirect: \"false\"
spec:
  rules:
  - http:
      paths:
      - path: /${APP}
        backend:
          serviceName: ${APP}
          servicePort: ${APP_PORT}
" | kubectl apply -f -


ssh nginx.venky.corp sudo echo "
location /sales/ { 
    proxy_pass $KUBECLUSTER/$APP; 
    proxy_redirect $KUBECLUSTER/$APP $APPLICATION_HOSTING; 
}" >> $NGINX_CONF

ssh nginx.venky.corp sudo nginx -s reload
