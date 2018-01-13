class WeatherController < ApplicationController
  def info
    @information = OpenWeather::Client.new(
      { id: seed_city_id }
    ).get
  end

  private

  def seed_city_id
    file = File.join(Rails.root, 'config', 'city.list.json')
    cities = JSON.parse File.read(file)
    city_ids = cities.map { |c| c["id"] }
    city_ids.sample
  end
end
