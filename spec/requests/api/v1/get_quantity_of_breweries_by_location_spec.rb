require 'rails_helper'

RSpec.describe '/api/v1/forecast?location=denver,co' do
  it 'returns a number of breweries for a city and state combo', :vcr do
    get '/api/v1/breweries?location=denver,co&quantity=5'

    expect(response.status).to eq(200)

    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)
    expect(parsed[:data].keys).to include(:id, :type, :attributes)
    expect(parsed[:data][:id]).to eq("null")
    expect(parsed[:data][:type]).to eq('breweries')
    expect(parsed[:data][:attributes].keys).to include(:destination, :forecast, :breweries)

    destination = parsed[:data][:attributes][:destination]
    expect(destination).to be_a(String)
    expect(destination).to eq('denver,co')

    forecast = parsed[:data][:attributes][:forecast]
    expect(forecast).to be_a(Hash)
    expect(forecast.keys).to include(:summary, :temperature)

    breweries = parsed[:data][:attributes][:breweries]
    expect(breweries).to be_an(Array)
    expect(breweries.count).to eq(5)
    expect(breweries.first).to be_a(Hash)
    expect(breweries.first.keys).to include(:id, :name, :brewery_type)
  end
end
