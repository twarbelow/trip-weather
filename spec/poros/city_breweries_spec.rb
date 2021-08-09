require 'rails_helper'

RSpec.describe Brewery do
  describe 'initialize' do
    it 'has expected attributes' do
      brewery_data = {
        "id": 13467,
        "name": "Pints Pub Brewery and Freehouse",
        "brewery_type": "brewpub",
      }
      location = 'denver,co'
      forecast = { "current": { "temp": 80.22, "weather": [ { "description": "overcast clouds" } ] } }
      breweries =[
        Brewery.new(brewery_data),
        Brewery.new(brewery_data),
        Brewery.new(brewery_data),
        Brewery.new(brewery_data),
        Brewery.new(brewery_data)
      ]

      object = CityBreweries.new(location, forecast, breweries)

      expect(object).to have_attributes(:location => location,
                                        :forecast => {summary: forecast[:current][:weather].first[:description], :temperature => "#{forecast[:current][:temp]} F"},
                                        :breweries => breweries)
    end
  end
end
