#!/bin/sh

psql -v ON_ERROR_STOP=1 --username "${POSTGRES_USER}" -d "postgres"  <<-EOF
  CREATE DATABASE "${GITLAB_POSTGRES_DATABASE}" WITH OWNER postgres ENCODING 'UTF8'; 
  CREATE USER "${GITLAB_POSTGRES_USERNAME}" WITH PASSWORD '${GITLAB_POSTGRES_PASSWORD}';
  ALTER USER "${GITLAB_POSTGRES_USERNAME}" WITH SUPERUSER;
EOF
