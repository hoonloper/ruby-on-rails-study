FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    done { Faker::Boolean.boolean }
    todo_id { nil }
  end
end
