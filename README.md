# Medieteknikdagarna 2015

## Setup

Install Ruby, Rails and Postgres.

### PostgreSQL setup

The following are `psql` commands:

1. Create database user, as seen in [`database.yml`](config/database.yml), we're gonna use `mtd` as username. Therefore, run `CREATE USER mtd;`.
2. Alter the user password by running `ALTER USER mtd WITH PASSWORD 'password';`.
3. Create development database by running `CREATE DATABASE mtd_development;` and create test database by running `CREATE DATABASE mtd_test;`.
4. Change database ownership by running `ALTER DATABASE mtd_development OWNER TO mtd;` and `ALTER DATABASE mtd_test OWNER TO mtd;`.
5. All done!

## Deploying

To deploy to Heroku, simply add the remote reference, and enter `git push heroku master` into your terminal. This will push the the local master branch to the corresponding remote branch.

When deployed, you might want to create the sitemap, since we don't wan't that tracked by git. So, with Heroku toolbelt installed, run `heroku run rake sitemap:refresh`. (This should be done automatically each night at 5:00 am, but you can never be sure enough, can you?)
