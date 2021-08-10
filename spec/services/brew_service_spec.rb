require 'rails_helper'

RSpec.describe BrewService do
  describe 'class method' do
    describe '::get_breweries' do
      it 'can get a quantity of breweries for a lat/lng combo', :vcr do
        response = BrewService.get_breweries(39.7392, -104.9903, 5)

        expect(response).to be_an(Array)
        expect(response.count).to eq(5)
        expect(response.first).to be_a(Hash)
        expect(response.first.keys).to include(:id, :name, :brewery_type)
      end
    end
  end
end
