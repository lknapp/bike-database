To get the dump from a deployed environment:

First, create a backup:
  heroku pg:backups:capture --app [app name]

Then, download the backup:
  heroku pg:backups:download [backup id] --app [app name]

Then, reset the local database:
  rake db:drop db:create db:migrate

Then, load the backup into the database:
  pg_restore --verbose --clean --no-acl --no-owner -h localhost -U [username] -d [database name] latest.dump
