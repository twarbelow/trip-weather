class BackgroundFacade
  def self.search_for_background(location)
    response = BackgroundService.get_city_image(location)
    Background.new(response[:results][0], location)
  end
end
