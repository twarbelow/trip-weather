require 'rails_helper'

RSpec.describe '/api/v1/forecast?location=denver,co' do
  it 'returns the weather for a city and state combo', :vcr do
    get '/api/v1/forecast?location=denver,co'

    expect(response.status).to eq(200)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:data)
    expect(parsed[:data].keys).to contain_exactly(:id, :type, :attributes)

    current = parsed[:data][:attributes][:current_weather]
    expect(current).to be_a(Hash)
    expect(current.keys).to contain_exactly(
                                              :datetime,
                                              :sunrise,
                                              :sunset,
                                              :temperature,
                                              :feels_like,
                                              :humidity,
                                              :uvi,
                                              :visibility,
                                              :conditions,
                                              :icon
                                            )

    daily = parsed[:data][:attributes][:daily_weather]
    expect(daily).to be_an(Array)
    expect(daily.first.keys).to contain_exactly(
                                                  :date,
                                                  :sunrise,
                                                  :sunset,
                                                  :max_temp,
                                                  :min_temp,
                                                  :conditions,
                                                  :icon
                                                )

    hourly = parsed[:data][:attributes][:hourly_weather]
    expect(hourly).to be_an(Array)
    expect(hourly.first.keys).to contain_exactly(
                                                  :time,
                                                  :temperature,
                                                  :conditions,
                                                  :icon
                                                )
  end
end
