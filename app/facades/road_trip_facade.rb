class RoadTripFacade
  def self.create_trip(origin, destination)
    travel_time = LocationFacade.calculate_travel_time(origin, destination)
    forecast = WeatherService.get_forecast(travel_time[:locations][1][:latLng])
    RoadTrip.new({origin: origin, destination: destination}, {human_time: travel_time[:formattedTime], seconds: travel_time[:time]}, forecast)
  end
end
