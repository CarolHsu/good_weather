require 'spec_helper'
require 'json'

describe 'weather/info.html.erb' do
  context "got successful response" do
    let(:fake_info) { JSON.parse '{"coord":{"lon":145.77,"lat":-16.92},"weather":[{"id":802,"main":"Clouds","description":"scattered clouds","icon":"03n"}],"base":"stations","main":{"temp":300.15,"pressure":1007,"humidity":74,"temp_min":300.15,"temp_max":300.15},"visibility":10000,"wind":{"speed":3.6,"deg":160},"clouds":{"all":40},"dt":1485790200,"sys":{"type":1,"id":8166,"message":0.2064,"country":"AU","sunrise":1485720272,"sunset":1485766550},"id":2172797,"name":"Cairns","cod":200}' }
    
    it 'should have a search input' do
      assign(:information, fake_info)
      render
      expect(rendered).to have_selector('div#search')
    end

    it 'should render city name' do
      assign(:information, fake_info)
      render
      expect(rendered).to have_selector('input#cityName')
    end

    it 'should render country code' do
      assign(:information, fake_info)
      render
      expect(rendered).to have_selector('div#information', text: fake_info["sys"]["country"])
    end

    it 'should render weather description' do
      assign(:information, fake_info)
      render
      expect(rendered).to have_selector('div#information', text: fake_info["weather"][0]["description"])
    end
  end

  context "got failed response" do
    it 'should not render information section' do
      assign(:information, {})
      render
      expect(rendered).not_to have_selector('div#information')
    end
  end

end
