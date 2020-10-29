require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end

  it 'total_calories' do
    tanaka = Chef.create!(name: "Chef Tanaka")
    sushi = tanaka.dishes.create!(name: "Sushi",
                                  description: "Awesome",
                                 )
    salmon = Ingredient.create!(name: "Salmon", calories: 50)
    rice = Ingredient.create!(name: "Rice", calories: 80)
    wasabi = Ingredient.create!(name: "Wasabi", calories: 10)
    DishIngredient.create!(dish: sushi, ingredient: salmon)
    DishIngredient.create!(dish: sushi, ingredient: rice)
    DishIngredient.create!(dish: sushi, ingredient: wasabi)

    expect(sushi.total_calories).to eq(140)
  end
end
