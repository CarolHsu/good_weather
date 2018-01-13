require 'rails_helper'

RSpec.describe WeatherController, type: :controller do

  describe 'Info' do
    before :each do
      srand(1)
    end

    it 'should render a new weather information template' do
      get :info
      expect(response).to render_template :info
    end

    it 'should assign a new weather information' do
      # Pending
      # get :info
      # expect(assigns[:information]).to be_a_new WeatherAPI::Client
    end

    it "should get a random city id" do
      controller = WeatherController.new
      seed_city_id = controller.send(:seed_city_id)
      expect(seed_city_id).to eq(1815202)
    end

  end

end
