FactoryBot.define do
  factory :subscription_customer do
    customer
    subscription
    status { Faker::Number.within(range: 0..2) }
    frequency { Faker::Number.within(range: 0..2) }
  end
end
