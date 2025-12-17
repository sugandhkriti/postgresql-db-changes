#!/bin/bash
set -e

DB_HOST=$1
DB_NAME=$2
DB_USER=$3
VERSION=$4

ROLLBACK_FILE="migrations/${VERSION}__rollback.sql"

if [[ ! -f "$ROLLBACK_FILE" ]]; then
  echo "Rollback file not found: $ROLLBACK_FILE"
  exit 1
fi

echo "Rolling back $VERSION on $DB_NAME"
psql -h $DB_HOST -U $DB_USER -d $DB_NAME -f $ROLLBACK_FILE
