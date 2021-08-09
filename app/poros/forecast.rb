class Forecast
  def initialize(data)
    @id = null
    @current_weather = current(data[:current])
    @hourly_weather = hourly(data[:hourly])
    @daily_weather = daily(data[:daily])
  end

  private

  def current(data)
    Current.new(data)
  end

  def hourly(data)
    data.first(8).map do |hour|
      Hour.new(hour)
    end
  end

  def daily(data)
    data.first(5).map do |day|
      Day.new(day)
    end
  end
end
