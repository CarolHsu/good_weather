class WeathersController < ApplicationController

  def show
    @information = OpenWeather::Client.new(
      { id: seed_city_id }
    ).get

  end

  def search
    @information = OpenWeather::Client.new(
      { q: params[:city_name].capitalize }
    ).get
    Rails.logger.info @information.inspect
    respond_to do |format|
      format.js
    end
  end

  private

  def seed_city_id
    file = File.join(Rails.root, 'config', 'city.list.json')
    cities = JSON.parse File.read(file)
    city_ids = cities.map { |c| c["id"] }
    city_ids.sample
  end
end
