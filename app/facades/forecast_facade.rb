class ForecastFacade
  def self.forecast(location)
    coords = LocationFacade.translate_to_coordinates(location)
    weather = WeatherService.get_forecast(coords[:lat], coords[:lng])
    Forecast.new(weather)
  end
end
