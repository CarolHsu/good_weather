# README

Good Weather is a service based on APIs of [OpenWeatherMap](https://openweathermap.org), it supposed to grab the realtime weather status of different city, you can also play my [demo](https://powerful-citadel-88502.herokuapp.com/)


## Setup

Modify `config/application.yml.exmple` to `config/application.yml`, fill your own API key from [open weather api](http://openweathermap.org/api)

```
$ git clone
$ bundle install

```

### Generate seed data

To improve the searching experience, we generate the seed city data from the list of open weather api.

```
$ rake db:migrate
$ rake seed_data:cities
```

And don't worry. The process might cost time.

### Run the server

```
$ rails s
```
Visit [http://localhost:3000](http://localhost:3000)

Now, you can check the current weather of every cities on the world, engoy!
