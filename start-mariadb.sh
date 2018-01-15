rm -rf mariadb-compose.yml; envsubst < "mariadb-compose-template.yml" > "mariadb-compose.yml";
sudo docker-compose -f mariadb-compose.yml up -d
