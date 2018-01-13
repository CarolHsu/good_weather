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


### Setup

Modify `config/application.yml.exmple` to `config/application.yml`, fill your own API key from [open weather api](http://openweathermap.org/api)

## Generate seed data

To improve the searching experience, we generate the seed city data from the list of open weather api.

```
$ rake db:migrate
$ rake seed_data:cities
```

And don't worry. The process might cost time.
