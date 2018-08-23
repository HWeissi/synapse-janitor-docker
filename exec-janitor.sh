PGPASSWORD=${DB_PASS}
psql --username=${DB_USER} -w --host=${DB_HOST} --dbname=${DB_NAME} --port=${DB_PORT} -f /usr/share/misc/synapse-janitor.sql >> /var/log/janitor.log