require 'rails_helper'

RSpec.describe '/api/v1/sessions' do
  it 'creates a new session when a user logs in with proper credentials' do
    user = create(:user, password: 'password')
    body_data = {
                  email: user.email,
                  password: user.password,
                }

    headers = {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(body_data)

    expect(response.status).to eq(200)

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:data)
    expect(parsed[:data].keys).to contain_exactly(:type, :id, :attributes)
    expect(parsed[:data][:type]).to eq('users')
    expect(parsed[:data][:id]).to eq(user.id.to_s)
    expect(parsed[:data][:attributes].keys).to contain_exactly(:email, :api_key)
    expect(parsed[:data][:attributes][:email]).to eq(user.email)
    expect(parsed[:data][:attributes][:api_key]).to eq(user.api_key)
  end

  it 'returns invalid credentials if email is incorrect' do
    user = create(:user, password: 'password')
    body_data = {
                  email: 'random@email.com',
                  password: user.password,
                }

    headers = {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(body_data)

    expect(response.status).to eq(401)
  end

  it 'returns invalid credtials response if password is incorrect for email' do
    user = create(:user, password: 'password')
    body_data = {
                  email: user.email,
                  password: 'wrongpassword',
                }

    headers = {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(body_data)

    expect(response.status).to eq(401)
  end
end
