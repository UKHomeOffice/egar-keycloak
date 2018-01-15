./stop-keycloak.sh

. ./setenv.sh
export MIGRATION_ACTION="export"
export DB_FILE="keycloak_db_export.json"

./start-keycloak.sh

eval "sudo docker cp keycloak:/opt/jboss/keycloak/$DB_FILE $DB_FILE"

sudo docker-compose down
