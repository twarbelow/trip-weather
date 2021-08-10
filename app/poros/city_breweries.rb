class CityBreweries
  attr_reader :id, :type, :destination, :forecast, :breweries

  def initialize(location, forecast, breweries)
    @id = "null"
    @type = 'breweries'
    @destination = location
    @forecast = {summary: forecast[:current][:weather].first[:description], temperature: "#{forecast[:current][:temp]} F"}
    @breweries = breweries
  end
end
