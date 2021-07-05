require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  before(:each) do
    @chef = Chef.create!({
      name: 'Matty Meatballs'
      })

    @dish = Dish.create!({
      name: 'Meatballs',
      description: 'Hearty, comes with four.',
      chef_id: "#{@chef.id}"
      })

    @ingredient_1 = Ingredient.create!({
      name: 'Meatballs',
      calories: 360
      })

    @ingredient_2 = Ingredient.create!({
      name: 'Marinara sauce',
      calories: 30
      })

    @d_i_meat = DishIngredient.create!({
      dish_id: @dish.id,
      ingredient_id: @ingredient_1.id
      })

    @d_i_sauce = DishIngredient.create!({
      dish_id: @dish.id,
      ingredient_id: @ingredient_2.id
      })
  end

  it "total calories can be counted" do
    expect(@dish.total_calories).to eq(390)
  end

  it "can list all ingredient names" do
    expect(@dish.ingredient_list).to eq(['Meatballs', 'Marinara sauce'])
  end
end
