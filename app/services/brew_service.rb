class BrewService
  def self.get_breweries(lat, lng, quantity)
    response = conn.get('/breweries') do |req|
      req.params['by_dist'] = "#{lat},#{lng}"
      req.params['per_page'] = quantity
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.openbrewerydb.org')
  end
end
