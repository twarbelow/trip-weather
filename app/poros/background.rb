class Background
  attr_reader :id, :location, :description, :image_url, :credit

  def initialize(data, location)
    @id = nil
    @location = location
    @description = data[:description]
    @image_url = data[:urls][:full]
    @credit = {source: "unsplash.com", author: data[:user][:name]}
  end
end
