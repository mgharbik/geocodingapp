FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    street { "123 Main St" }
    city { "Berlin" }
    zip { "12345" }
  end
end
