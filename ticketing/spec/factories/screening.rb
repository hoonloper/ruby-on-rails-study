FactoryBot.define do
  factory :screening do
    show_date { Faker::Date.between from: '2022-01-01', to: '2023-12-31' }
    start_time { Faker::Date.between from: '2022-01-01', to: '2023-12-31' }
    end_time { Faker::Date.between from: '2022-01-01', to: '2023-12-31' }
  end
end