# Medieteknikdagarna 2015

English: The Media Technology Days 2015

## Setup

Install [Ruby](https://www.ruby-lang.org/en/), [Rails](http://rubyonrails.org/) and [PostgreSQL](http://www.postgresql.org/). If you're on a Mac, [Heroku's *Postgres.app*](http://postgresapp.com/) is nice.

### PostgreSQL setup

The following are `psql` commands:

1. Create database user, as seen in [`database.yml`](config/database.yml), we're gonna use `mtd` as username. Therefore, run `CREATE USER mtd;`.
2. Alter the user password by running `ALTER USER mtd WITH PASSWORD 'password';`.
3. Create development database by running `CREATE DATABASE mtd_development;` and create test database by running `CREATE DATABASE mtd_test;`.
4. Change database ownership by running `ALTER DATABASE mtd_development OWNER TO mtd;` and `ALTER DATABASE mtd_test OWNER TO mtd;`.
5. All done!

### User handeling

We have a Devise and CanCan-based user system in place here. It utilizes a simple Role structure that [Tony Amoyal](http://www.tonyamoyal.com/2010/07/28/rails-authentication-with-devise-and-cancan-customizing-devise-controllers/) came up with.

Our roles are in [`db/seeds.rb`](db/seeds.rb), and to install them simply run `rake db:seed` in you console. The roles that exists are:
* `SuperAdmin` – can do everything
* `Admin` – can do everything but handle roles
* `CompanyRepresentative` – can edit a company's information
* `Photographer` – can add photos and remove their own photos
* `Speaker` – can edit information about a given event/speaker

Without a role, an user can't do anything but edit their own information.

#### Adding a user

To add an user for development purposes and give it super admin rights, do this:

1. When in the root of this app, run `rake db:migrate` and `rake db:seed` to make sure you have the latest version of the database and the seeds.
2. Enter the Rails console by typing `rails console` into your console when in the root of this app.
3. Create the admin by typing `my_admin = User.create(:email => 'admin@localhost')`. This should pop open a [Letter Opener](https://rubygems.org/gems/letter_opener) email. You can replace the email with whatever you want.
4. Then, append the `SuperAdmin` role to the user by typing `my_admin.roles.append(Role.find_by(name: 'SuperAdmin'))`. The `append` method is an alias to the `<<` method of the [ActiveRecord `CollectionProxy`](http://edgeapi.rubyonrails.org/classes/ActiveRecord/Associations/CollectionProxy.html) class.
5. Done!

## Deploying

To deploy to Heroku, simply add the remote reference, and enter `git push heroku master` into your terminal. This will push the the local master branch to the corresponding remote branch.

When deployed, you might want to create the sitemap, since we don't wan't that tracked by git. So, with Heroku toolbelt installed, run `heroku run rake sitemap:refresh`. (This should be done automatically each night at 5:00 am, but you can never be sure enough, can you?)

## Environment variables

Make sure that the system has access to the variables stated in [`application.example.yml`](config/application.example.yml), and remove `.example` from the file name.
