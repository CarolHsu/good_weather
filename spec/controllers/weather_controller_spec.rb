require 'rails_helper'

RSpec.describe WeatherController, type: :controller do

  describe 'Info' do
    before :each do
      srand(1)
    end

    describe 'GET#info', :vcr do

      it 'should render a new weather information template' do
        get :info
        expect(response).to render_template :info
      end

      it 'should call OpenWeather Client once' do
        get :info
        expect(assigns[:information]["cod"]).to eq(200)
      end

    end


    it "should get a random city id" do
      seed_city_id = controller.send(:seed_city_id)
      expect(seed_city_id).to eq(1815202)
    end

  end

end
