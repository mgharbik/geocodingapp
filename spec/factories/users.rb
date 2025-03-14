FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    password { "password123" }
    password_confirmation { "password123" }
    street { "Irisring 1" }
    city { "Berlin" }
    zip { "13089" }
  end
end
