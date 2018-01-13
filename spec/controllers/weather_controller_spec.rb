require 'rails_helper'

RSpec.describe WeatherController, type: :controller do

  describe 'Info' do

    it 'should render a new weather information template' do
      get :info
      expect(response).to render_template :info
    end

    it 'should assign a new weather information' do
      # Pending
      # get :info
      # expect(assigns[:information]).to be_a_new WeatherAPI::Client
    end

  end

end
