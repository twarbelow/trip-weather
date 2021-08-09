require 'rails_helper'

RSpec.describe 'Breweries Facade' do
  describe '::breweries' do
    it 'creates a CityBreweries object', :vcr do
      city_brews = BreweriesFacade.breweries('denver,co', 5)
      expect(city_brews).to be_a(CityBreweries)
      expect(city_brews.destination).to be_a(String)
      expect(city_brews.forecast).to be_a(Hash)
      city_brews.breweries.each do |brewery|
        expect(brewery).to be_a(Brewery)
      end
    end
  end
end
