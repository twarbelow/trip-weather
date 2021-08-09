class CityBreweries
  attr_reader :id, :type, :location, :forecast, :breweries

  def initialize(location, forecast, breweries)
    @id = nil
    @type = 'breweries'
    @location = location
    @forecast = {summary: forecast[:current][:weather].first[:description], temperature: "#{forecast[:current][:temp]} F"}
    @breweries = breweries
  end
end
