echo "${DB_HOST}:${DB_PORT}:${DB_NAME}:${DB_USER}:${DB_PASS}" > ~/.pgpass 
chmod 600 ~/.pgpass
psql --username=${DB_USER} -w --host=${DB_HOST} --dbname=${DB_NAME} --port=${DB_PORT}  -f /usr/share/misc/synapse-janitor.sql >> /var/log/janitor.log;
echo "Script done" >> /var/log/janitor.log
docker restart ${SYNAPSE_CONTAINER_NAME}
echo "Restarted container" >> /var/log/janitor.log
