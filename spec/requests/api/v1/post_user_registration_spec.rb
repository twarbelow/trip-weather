require 'rails_helper'

RSpec.describe 'User Registration' do
  it 'registers a new user' do
    body_data = {
                  email: "test@test.com",
                  password: "password",
                  password_confirmation: "password"
                }

    headers = {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              }

    post '/api/v1/users', headers: headers, params: JSON.generate(body_data)

    expect(User.all.last.email).to eq(body_data[:email])

    expect(response.status).to eq(201)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to have_key(:data)
    expect(result[:data].keys).to include(:id, :type, :attributes)
    expect(result[:data][:id]).to be_a(String)
    expect(result[:data][:type]).to eq('users')
    expect(result[:data][:attributes].keys).to include(:email, :api_key)
    expect(result[:data][:attributes][:email]).to eq(body_data[:email])
    expect(result[:data][:attributes][:api_key]).to be_a(String)
  end
end
