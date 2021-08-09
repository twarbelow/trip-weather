class GeoService
  def self.get_coordinates(location)
    response = Faraday.get('http://www.mapquestapi.com/geocoding/v1/address') do |req|
      req.params['key'] = ENV['GEO_API_KEY']
      req.params['location'] = location
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
