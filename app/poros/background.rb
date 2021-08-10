class Background
  attr_reader :location, :description, :image_url, :credit

  def initialize(data, location)
    @location = location
    @description = data[:description]
    @image_url = data[:urls][:full]
    @credit = {source: "unsplash.com", author: data[:user][:name]}
  end
end
