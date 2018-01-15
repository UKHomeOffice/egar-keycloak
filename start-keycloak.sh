rm -rf docker-compose.yml; envsubst < "docker-compose-template.yml" > "docker-compose.yml";
sudo docker-compose up -d
./wait-for-keycloak.sh
