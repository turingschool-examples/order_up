FactoryBot.define do
  factory :chef do
    name { Faker::Name.first_name }
  end
end
