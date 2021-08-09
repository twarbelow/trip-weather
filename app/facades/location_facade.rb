class LocationFacade
  def self.translate_to_coordinates(location)
    response = GeoService.get_coordinates(location)
    coords = response[:results].first[:locations.first[:latLng]]
    { lat: coords[:lat], lng: coords[:lng] }
  end
end
