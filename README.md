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
