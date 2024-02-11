FactoryBot.define do
  factory :ticket do
    username { Faker::Name.unique }
    screening_id { nil }
  end
end