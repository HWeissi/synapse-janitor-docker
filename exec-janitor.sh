PGPASSWORD=${DB_PASS}
psql --username=${DB_USER} -w -dbname=${DB_NAME} --port=${DB_PORT} -f /usr/share/misc/synapse-janitor.sql >> /var/log/janitor.log