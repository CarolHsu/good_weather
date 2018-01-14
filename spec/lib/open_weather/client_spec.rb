require 'spec_helper'
require './lib/open_weather/client'

describe OpenWeather::Client do
  describe "#initialize" do
    context "when query by city_id" do

      let(:city_id) { 1815202 }
      let(:client) { OpenWeather::Client.new({id: city_id}) }

      it "should have options key of id" do
        expect(client.options[:id]).to be(city_id)
      end

      it "should generate request by city_id" do
        expected_request = "#{OpenWeatherHost}/data/#{OpenWeatherVersion}/weather?appid=#{OpenWeatherSecret}&id=#{city_id}"
        expect(client.send(:url_generator)).to eq(expected_request)
      end

      context "when getting response seccessfully", :vcr do
        it "should return response as hash" do
          response = client.get
          expect(response).to be_a Hash
        end

        it "should return response with city_id" do
          response = client.get
          expect(response["id"]).to eq(city_id)
        end
      end

      context "when getting response failed" do
        let(:failed_client) { OpenWeather::Client.new }
        let(:error_status_code_client) { OpenWeather::Client.new(id: 123) }

        it "should return empty hash when bad request" do
          response = failed_client.get
          expect(response).to be_empty
        end

        it "should return empty hash when error status response", :vcr do
          response = error_status_code_client.get
          expect(response).to be_empty
        end
      end
    end

    context "when query by city" do
      let(:city_name) { "London" }
      let(:client) { OpenWeather::Client.new({q: city_name}) }

      it "should have options key of q" do
        expect(client.options[:q]).to be(city_name)
      end

      it "should generate request by city_name" do
        expected_request = "#{OpenWeatherHost}/data/#{OpenWeatherVersion}/weather?appid=#{OpenWeatherSecret}&q=#{city_name}"
        expect(client.send(:url_generator)).to eq(expected_request)
      end

      context "when getting response seccessfully", :vcr do
        it "should return response as hash" do
          response = client.get
          expect(response).to be_a Hash
        end

        it "should return response with city_name" do
          response = client.get
          expect(response["name"]).to eq(city_name.capitalize)
        end
      end
    end
  end
end
