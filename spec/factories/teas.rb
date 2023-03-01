FactoryBot.define do
  factory :tea do
    temperatures = ["cold", "warm", "hot"]
    title { Faker::Tea.variety }
    description { Faker::Lorem.sentence }
    temperature { temperatures.sample }
    brew_time { Faker::Number.between(from: 1, to: 20) }
  end
end
