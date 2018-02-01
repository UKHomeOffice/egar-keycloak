#!/bin/sh
# kubectl delete -f keycloak-claim0-persistentvolumeclaim.yaml
kubectl delete -f keycloak-deployment.yaml
kubectl delete -f keycloak-service.yaml
kubectl delete -f maildev-deployment.yaml
kubectl delete -f maildev-service.yaml
kubectl delete -f mariadb-deployment.yaml
kubectl delete -f mariadb-service.yaml
kubectl delete -f keycloak-secrets.yaml
# kubectl delete -f ../pvtest/local-volumes.yaml
# Stop the NodePort service from exposing the kc instance
# kubectl delete service kcsvc
