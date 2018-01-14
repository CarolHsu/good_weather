class CitiesController < ApplicationController
  def index
    @cities = City.where("name like ?", "#{params[:term]}%").order(:name).map(&:name_with_country_code).uniq
    render json: @cities
  end
end
