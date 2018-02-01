#!/bin/sh
# kubectl create -f ../pvtest/local-volumes.yaml
# kubectl create -f keycloak-claim0-persistentvolumeclaim.yaml
kubectl create -f keycloak-secrets.yaml
kubectl create -f maildev-deployment.yaml
kubectl create -f maildev-service.yaml
kubectl create -f mariadb-deployment.yaml
kubectl create -f mariadb-service.yaml
kubectl create -f keycloak-deployment.yaml
kubectl create -f keycloak-service.yaml
# Expose the keycloak server on the node which runs the keycloak-theme instance
# kubectl expose deployment keycloak --type=LoadBalancer --name=kcsvc --external-ip=10.12.18.35
export PODID=`kubectl get all | grep po/keycloak | awk '{print $1}'`
echo The POD ID is $PODID
