module OpenWeather
  class Client
    attr_reader :options

    def initialize(options={})
      @options = options
    end

    def get
      begin
        response = RestClient.get url_generator
        if response.code == 201 or response.code == 200
          return JSON.parse response.body
        else
          return {}
        end
      rescue => e
        Rails.logger.error e
        return {}
      end
    end

    private

    def url_generator
      options.merge!({ appid: OpenWeatherSecret })
      query_string = options.to_query
      "#{OpenWeatherHost}/data/#{OpenWeatherVersion}/weather?#{query_string}"
    end
  end
end
