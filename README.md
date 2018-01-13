# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


### Install

```
Heroku already makes setting application configuration easy:

```
$ heroku config:set google_analytics_key=UA-35722661-5
```

Using the figaro command, you can set values from your configuration file all at once:

```
$ figaro heroku:set -e production
```

For more information:

```
$ figaro help heroku:set
```

Other Hosts

If you're not deploying to Heroku, you have two options:

* Generate a remote configuration file
* Set ENV variables directly

Generating a remote configuration file is preferred because of:

* familiarity – Management of config/application.yml is like that of config/database.yml.
* isolation – Multiple applications on the same server will not produce configuration key collisions.

## Generate seed data

To improve the searching experience, we generate the seed city data from the list of open weather api.

```
$ rake db:migrate
$ rake seed_data:cities
```

And don't worry. The process might cost time.
