FactoryBot.define do
  factory :theater do
    name { Faker::Lorem.name }
    max_audience_count { Faker::Number.number(digits: 2) }
  end
end