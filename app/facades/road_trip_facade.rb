class RoadTripFacade
  def self.create_trip(origin, destination)
    travel_time = LocationFacade.calculate_travel_time(origin, destination)
    forecast = WeatherService.get_forecast(travel_time[:route][:locations][1][:latLng][:lat],
                                           travel_time[:route][:locations][1][:latLng][:lng])
    RoadTrip.new({origin: origin, destination: destination},
                 {human_time: travel_time[:route][:formattedTime], seconds: travel_time[:route][:time]},
                 forecast)
  end
end
