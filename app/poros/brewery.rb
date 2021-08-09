class Brewery
  attr_reader :id, :name, :brewery_type

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @brewery_type = data[:id]
  end
end
