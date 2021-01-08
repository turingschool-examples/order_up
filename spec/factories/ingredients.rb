FactoryBot.define do
  factory :ingredient do
    name { Faker::Name.last_name }
    calories { Faker::Number.between(from: 5, to: 20) }
  end
end
