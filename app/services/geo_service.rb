class GeoService
  def self.get_coordinates(location)
    parse("/geocoding/v1/address?location=#{location}")
  end

  def self.get_travel_time(origin, destination)
    parse("/directions/v2/route?from=#{origin}&to=#{destination}")
  end

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com') do |req|
      req.params['key'] = ENV['GEO_API_KEY']
    end
  end

  def self.parse(uri)
    response = conn.get(uri)
    JSON.parse(response.body, symbolize_names: true)
  end
end
