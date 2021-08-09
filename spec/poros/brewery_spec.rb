require 'rails_helper'

RSpec.describe Brewery do
  describe 'initialize' do
    it 'has expected attributes' do
      data = {
        "id": 13467,
        "obdb_id": "pints-pub-brewery-and-freehouse-denver",
        "name": "Pints Pub Brewery and Freehouse",
        "brewery_type": "brewpub",
        "street": "221 W 13th Ave",
        "address_2": null,
        "address_3": null,
        "city": "Denver",
        "state": "Colorado",
        "county_province": null,
        "postal_code": "80204-2711",
        "country": "United States",
        "longitude": "-104.9908538",
        "latitude": "39.737018",
        "phone": "3035347543",
        "website_url": "http://www.pintspub.com",
        "updated_at": "2018-08-24T00:00:00.000Z",
        "created_at": "2018-07-24T00:00:00.000Z"
      }

      object = Brewery.new(data)

      expect(object).to have_attributes(id: data[:id], name: data[:name], brewery_type: data[:brewery_type])
    end
  end
end
