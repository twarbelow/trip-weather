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


# GET /api/v1/forecast?location=denver,co
# Content-Type: application/json
# Accept: application/json
# {
#   "data": {
#     "id": null,
#     "type": "forecast",
#     "attributes": {
#       "current_weather": {
#         "datetime": "2020-09-30 13:27:03 -0600",
#         "sunrise": "2020-09-30 13:27:03 -0600",
#         "sunset": "2020-09-30 13:27:03 -0600",
#         "temperature": 79.4,
#         "feels_life": 79.4,
#         "humidity": 79.4, (int or float, as given by open weater)
#         "uvi": 79.4, (int or float, as given by open weater)
#         "visibility": 79.4, (int or float, as given by open weater)
#         "conditions": "the first description field from the weather data from openeather",
#         "icon": "string given openweatherr"
#       },
#       "daily_weather": [ (this is an array of the next 5 days)
#         {
#           "date": "2020-10-01",
#           "sunrise": "2020-10-01 06:10:43 -0600",
#         "sunset": "2020-09-30 13:27:03 -0600",
#         "sunset": "2020-09-30 13:27:03 -0600",
#         "max_temp": 79.4,
#         "min_temp": 79.4,
#         "conditions": "the first description field from the weather data from openeather",
#         "icon": "string given openweatherr"
#         },
#         {...} etc
#       ],
#       "hourly_weather": [
#         {
#           "time": "14:00:00",
#           "temperature": 79.4,
#           "conditions": "cloudy with a chance of meatballs",
#           "icon": "string given openweatherr"
#         },
#         {...} etc
#       ]
