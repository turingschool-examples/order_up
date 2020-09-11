require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe 'instance methods' do
    it 'all ingredients' do
      george = Chef.create!(name: "George")

      dish_1 = Dish.create!(name: "Camel meatballs", description: "Succulent camel meat in spaghetti sauce", ingredients: "camel meat, spaghetti sauce, parmesean", calories: "3,455cal", chef_id: george.id)
      dish_2 = Dish.create!(name: "Lasangua", description: "Layers of iguana lasangua", ingredients: "iguana, spaghetti sauce, parmesean, garlic", calories: "3,300cal", chef_id: george.id)

      expected = ["camel meat", "spaghetti sauce", "parmesean", "iguana", "garlic"]

      expect(george.all_ingredients).to eq(expected)
    end
  end

  describe 'instance methods' do
    it 'most popular ingredients' do
      george = Chef.create!(name: "George")

      dish_1 = Dish.create!(name: "Camel meatballs", description: "Succulent camel meat in spaghetti sauce", ingredients: "camel meat, spaghetti sauce, parmesean", calories: "3,455cal", chef_id: george.id)
      dish_2 = Dish.create!(name: "Lasangua", description: "Layers of iguana lasangua", ingredients: "iguana, spaghetti sauce, parmesean, garlic", calories: "3,300cal", chef_id: george.id)
      dish_3 = Dish.create!(name: "Chef Salad", description: "Fancy salad", ingredients: "iceberg lettuce, parmesean, garlic", calories: "300cal", chef_id: george.id)


      expected = ["spaghetti sauce", "parmesean", "garlic"]

      expect(george.most_popular).to eq(expected)
    end
  end
end
