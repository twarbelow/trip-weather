class BackgroundService
  def self.get_city_image(location)
    response = conn.get('/search/photos') do |req|
      req.params['client_id'] = ENV['BACKGROUND_API_KEY']
      req.params['query'] = "city of #{location}"
      req.params['per_page'] = 1
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.unsplash.com')
  end
end
