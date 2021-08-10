FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    api_key { SecureRandom.base58 }
    password_digest { Faker::Internet.password }
  end
end
