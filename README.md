# Medieteknikdagarna 

English: The Media Technology Days

## Setup

Install [Ruby](https://www.ruby-lang.org/en/), [Rails](http://rubyonrails.org/), [Foreman](https://github.com/ddollar/foreman), [Heroku Command Line Interface](https://devcenter.heroku.com/articles/heroku-cli) and [PostgreSQL](http://www.postgresql.org/). If you're on a Mac, [Heroku's *Postgres.app*](http://postgresapp.com/) is nice.

### Running

To start the app, run `foreman start -p <port number>` in your terminal. This does what the [`Procfile`](Procfile) tells it to do.

If it is the first time you're running this app, you'll probably want to run all these commands:

```
bundle install
rake db:migrate
rake db:seed
foreman start -p 3000
```

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

#### Adding a user to development environment

To add a user for development (local) purposes and give it super admin rights, do this:

1. When in the root of this app, run `rake db:migrate` and `rake db:seed` to make sure you have the latest version of the database and the seeds.
2. Enter the Rails console by typing `heroku run rails console` into your console when in the root of this app.
3. Create the admin by typing `my_admin = User.create(:email => 'admin@localhost', :name => 'Name Nameson')`. This should pop open a [Letter Opener](https://rubygems.org/gems/letter_opener) email. You can replace the email with whatever you want.
4. Then, append the `SuperAdmin` role to the user by typing `my_admin.roles.append(Role.find_by(name: 'SuperAdmin'))`. The `append` method is an alias to the `<<` method of the [ActiveRecord `CollectionProxy`](http://edgeapi.rubyonrails.org/classes/ActiveRecord/Associations/CollectionProxy.html) class.
5. Done!


#### Adding a user to production environment

This is done to be able to log in to the admin interface at *medieteknikdagarna.se/admin*.

1. Enter the Rails console by typing `heroku run rails console` into your console when in the root of this app.
2. Create the admin by typing `my_admin = User.create(:email => '<your email>', :name => '<your name>')`. This should pop open a [Letter Opener](https://rubygems.org/gems/letter_opener) email. Replace the email with your email.
3. Then, append the `SuperAdmin` role to the user by typing `my_admin.roles.append(Role.find_by(name: 'SuperAdmin'))`. The `append` method is an alias to the `<<` method of the [ActiveRecord `CollectionProxy`](http://edgeapi.rubyonrails.org/classes/ActiveRecord/Associations/CollectionProxy.html) class.
4. Save the changes by typing `my_admin.save`.
5. An email is delivered to the email address that was specified above. Confirm and choose a password. 
6. Done!



## Deploying

To deploy to Heroku, add Heroku as remote reference (if it doesn't already exists, check with `git remote -v`) and push the changes to the remote reference using git:

 ```
 git add .
 git commit -m "<some commit message>"
 git push heroku master
 ```

This will push the the local master branch to the corresponding remote branch.

When deployed, you might want to create the sitemap, since we don't wan't that tracked by git. So, with Heroku toolbelt installed, run `heroku run rake sitemap:refresh`. (This should be done automatically each night at 5:00 am, but you can never be sure enough, can you?)

## Environment variables

Make sure that the system has access to the variables stated in [`application.example.yml`](config/application.example.yml), and remove `.example` from the file name.

## Known problems

* Images aren't deleted from S3
