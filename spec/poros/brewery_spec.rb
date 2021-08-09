require 'rails_helper'

RSpec.describe Brewery do
  describe 'initialize' do
    it 'has expected attributes' do
      data = {
        "id": 13467,
        "name": "Pints Pub Brewery and Freehouse",
        "brewery_type": "brewpub",
      }

      object = Brewery.new(data)

      expect(object).to have_attributes(id: data[:id], name: data[:name], brewery_type: data[:brewery_type])
    end
  end
end
