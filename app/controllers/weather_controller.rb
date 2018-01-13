class WeatherController < ApplicationController
  def info
    #TODO implement OpenWeatherAPI::Client in lib
    @information = OpenWeatherAPI::Client.new.get(city_id: seed_city_id)
  end

  private

  def seed_city_id
    file = File.join(Rails.root, 'config', 'city.list.json')
    cities = JSON.parse File.read(file)
    city_ids = cities.map { |c| c["id"] }
    city_ids.sample
  end
end
