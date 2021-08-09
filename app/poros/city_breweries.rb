class CityBreweries
  attr_reader :location, :forecast, :breweries

  def initialize(location, forecast, breweries)
    @location = location
    @forecast = {summary: forecast[:current][:weather].first[:description], temperature: "#{forecast[:current][:temp]} F"}
    @breweries = breweries
  end
end
