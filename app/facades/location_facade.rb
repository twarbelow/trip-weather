class LocationFacade
  def self.translate_to_coordinates(location)
    response = GeoService.get_coordinates(location)
    response[:results].first[:locations].first[:latLng]
  end

  # def self.calculate_travel_time(origin, destination)
  #
  # end
end
