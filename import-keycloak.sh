. ./setenv.sh
export MIGRATION_ACTION="import"
export DB_FILE="keycloak_db.json"
npm run build
./start-mariadb.sh
./start-keycloak.sh
