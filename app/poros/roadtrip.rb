class Roadtrip
  attr_reader :id, :type, :start_city, :end_city, :travel_time, :weather_at_eta

  def initialize(locations, times, forecast)
    @id = nil
    @type = 'roadtrip'
    @start_city = locations[:origin]
    @end_city = locations[:destination]
    @travel_time = times[:human_time]
    @weather_at_eta = temp_and_conditions(forecast, times[:seconds])
  end

  private

  def temp_and_conditions(forecast, route_time)
    arrival = (forecast[:current][:dt] + route_time)
    forecast_for_eta = forecast[:hourly].find do |hour|
      hour[:dt] == (arrival / 3600).to_i * 3600
    end
    { temperature: forecast_for_eta[:temp], conditions: forecast_for_eta[:weather].first[:description] }
  end
end
