require 'rails_helper'

RSpec.describe WeathersController, type: :controller do

  describe 'Root Path' do
    before :each do
      srand(1)
    end

    describe 'GET#show', :vcr do

      it 'should render a new weather information template' do
        get :show
        expect(response).to render_template :show
      end

      it 'should call OpenWeather Client once' do
        get :show
        expect(assigns[:information]["cod"]).to eq(200)
      end

    end


    it "should get a random city id" do
      seed_city_id = controller.send(:seed_city_id)
      expect(seed_city_id).to eq(1815202)
    end

  end

  describe 'GET#search', :vcr do

      it 'render js template' do
        get :search, params: {:city_name => "London,uk"}, xhr: true
        expect(response).to render_template("search")
      end

  end

end
