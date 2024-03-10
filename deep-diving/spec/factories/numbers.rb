FactoryBot.define do
  factory :number do
    integer_num { Faker::Number.number(digits: 2) }
    float_num { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end