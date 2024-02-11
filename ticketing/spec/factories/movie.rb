FactoryBot.define do
  factory :movie do
    title { Faker::Lorem.word }
    director { Faker::Name.name }
  end
end