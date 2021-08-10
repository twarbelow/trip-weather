require 'rails_helper'

RSpec.describe '/api/v1/road_trip' do
  it 'returns road trip details including weather forecast information', :vcr do
    user = create(:user)
    
    body = {
      origin: 'denver,co',
      destination: 'pueblo,co',
      api_key: user.api_key
    }

    headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    }

    post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)

    parsed = JSON.parse(response.body, symbolize_name: true)

    expect(parsed).to have_key(:data)
    expect(parsed[:data].keys).to include(:id, :type, :attributes)
    expect(result[:data][:id]).to eq(nil)
    expect(result[:data][:type]).to eq('roadtrip')
    expect(parsed[:data][:attributes].keys).to include(:start_city, :end_city, :travel_time, :weather_at_eta)
    expect(result[:data][:attributes][:start_city]).to eq(body_data[:origin])
    expect(result[:data][:attributes][:end_city]).to eq(body_data[:destination])
    expect(parsed[:data][:attributes][:weather_at_eta].keys).to include(:temperature, :conditions)
    expect(result[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Numeric)
    expect(result[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end
end
