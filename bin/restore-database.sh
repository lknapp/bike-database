#!/usr/bin/env bash

heroku pg:backups capture --app recyclery-database
sleep 3
curl -o tmp/latest.dump `heroku pg:backups public-url --app recyclery-database`
pg_restore --verbose --clean --no-acl --no-owner -h localhost -U louisk -d db/bikedb_development tmp/latest.dump

