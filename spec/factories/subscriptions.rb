FactoryBot.define do
  factory :subscription do
    title { Faker::Lorem.word }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end
