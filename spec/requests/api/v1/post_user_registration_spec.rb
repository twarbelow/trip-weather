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
    expect(result[:data].keys).to contain_exactly(:id, :type, :attributes)
    expect(result[:data][:id]).to be_a(String)
    expect(result[:data][:type]).to eq('users')
    expect(result[:data][:attributes].keys).to contain_exactly(:email, :api_key)
    expect(result[:data][:attributes][:email]).to eq(body_data[:email])
    expect(result[:data][:attributes][:api_key]).to be_a(String)
  end

  it 'returns bad request if email is already in use' do
    create(:user, email: 'test@app.com')

    body_data = {
                  email: "test@app.com",
                  password: "password",
                  password_confirmation: "password"
                }

    headers = {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              }

    post '/api/v1/users', headers: headers, params: JSON.generate(body_data)

    expect(response.status).to eq(400)
  end

  it 'returns bad request if password and confirmation do not match' do
    user = create(:user)

    body_data = {
                  email: user.email,
                  password: user.password,
                  password_confirmation: "pickles"
                }

    headers = {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              }

    post '/api/v1/users', headers: headers, params: JSON.generate(body_data)

    expect(response.status).to eq(401)
  end
end
