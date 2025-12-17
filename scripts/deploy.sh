#!/bin/bash
set -e

DB_HOST=$1
DB_NAME=$2
DB_USER=$3

echo "Deploying migrations to $DB_NAME"

for file in migrations/V*__*.sql; do
  if [[ "$file" != *rollback* ]]; then
    echo "Running $file"
    psql -h $DB_HOST -U $DB_USER -d $DB_NAME -f $file
  fi
done
