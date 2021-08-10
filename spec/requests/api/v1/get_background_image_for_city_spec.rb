require 'rails_helper'

RSpec.describe '/api/v1/backgrounds?' do
  it 'retrieves an appropriate image for a location' do
    get '/api/v1/backgrounds?location=denver,co'

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to have_key(:data)
    expect(result[:data].keys).to include(:id, :type)
    expect(result[:data][:id]).to eq(nil)
    expect(result[:data][:type]).to eq('background')

    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes]).to be_a(Hash)
    expect(result[:data][:attributes].keys).to include(:image_url, :description, :credit)
    expect(result[:data][:attributes][:image_url]).to be_a(String)
    expect(result[:data][:attributes][:description]).to be_a(String)
    expect(result[:data][:attributes][:credit]).to be_a(Hash)
    expect(result[:data][:attributes][:credit].keys).to include(:source, :author)
    expect(result[:data][:attributes][:credit][:source]).to be_a(String)
    expect(result[:data][:attributes][:credit][:author]).to be_a(String)
  end
end
