require 'rails_helper'

describe 'BackgroundService' do
  it 'Returns parsed JSON responses for the Unsplash image API', :vcr do
    data = BackgroundService.city_image_search('denver,co')

    expect(data).to be_a(Hash)
    expect(data).to have_key(:results)
    expect(data[:results]).to be_an(Array)
    expect(data[:results].first).to be_a(Hash)
    expect(data[:results].first.keys).to include(:description, :urls, :user)
    expect(data[:results].first[:user]).to have_key(:name)
    expect(data[:results].first[:user][:name]).to be_a(String)
    expect(data[:results].first[:urls]).to be_a(Hash)
    expect(data[:results].first[:urls].heys).to include(:raw, :full, :portfolio_url)
  end
end
