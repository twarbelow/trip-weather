class Hour
  attr_reader :time, :temperature, :conditions, :icon

  def initialize(hour)
    @time = Time.at(hour[:dt]).strftime("%k:%M:%S")
    @temperature = hour[:temp]
    @conditions = hour[:weather].first[:description]
    @icon = hour[:weather].first[:icon]
  end
end
