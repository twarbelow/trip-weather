class Hour
  attr_reader :time, :temperature, :conditions, :icon

  def initialize(data)
    @time = Time.at(data[:dt]).strftime("%k:%M:%S")
    @temperature = data[:temp]
    @conditions = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end
end
