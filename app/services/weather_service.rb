class WeatherService
  def self.get_forecast(lat, lng)
    response = Faraday.get('https://api.openweathermap.org/data/2.5/onecall') do |req|
      req.params['appid'] = ENV['WEATHER_API_KEY']
      req.params['lat'] = lat
      req.params['lon'] = lng
      req.params['units'] = 'imperial'
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
