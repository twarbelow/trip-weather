class BreweriesFacade
  def self.breweries(location, quantity)
    coords = LocationFacade.translate_to_coordinates(location)
    forecast = WeatherService.get_forecast(coords[:lat], coords[:lng])
    brew_response = BrewService.get_breweries(coords[:lat], coords[:lng], quantity)
    breweries = brew_response.map do |brewery|
      Brewery.new(brewery)
    end
    CityBreweries.new(location, forecast, breweries)
  end
end
