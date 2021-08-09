class BrewService
  def self.get_breweries(lat, lng, quantity)
    response = conn.get('/breweries') do |req|
      req.params['by_dist'] = "#{lat},#{lng}"
      req.params['per_page'] = quantity
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: 'https://api.openbrewerydb.org')
  end
end


# by_dist
# Sort the results by distance from an origin point, denoted by latitude,longitude.
#
# Example
# https://api.openbrewerydb.org/breweries?by_dist=38.8977,77.0365
