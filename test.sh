#!/usr/bin/env bash

echo "Inserting a new user into the database..."
sqlite3 db.sqlite3 <<SQL
  insert into users (name, email)
  values ('Charlie', 'charlie@example.com');
SQL

echo "Running \`git diff\`..."
git diff db.sqlite3
