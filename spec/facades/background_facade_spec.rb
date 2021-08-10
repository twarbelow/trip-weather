require 'rails_helper'

RSpec.describe 'Background Facade' do
  describe '::search_for_background' do
    it 'creates a Background object', :vcr do
      background = BackgroundFacade.get_city_image('denver,co')

      expect(background).to be_a(Background)
      expect(background.image_url).to be_a(String)
      expect(background.author).to be_a(String)
      expect(background.description).to be_a(String)
    end
  end
end
