require 'rails_helper'

describe DishIngredient, type: :model do
  describe "relationships" do
    it { should belong_to :dish }
    it { should belong_to :ingredient }
  end

  it "should calculate how often ingredient used" do
    @chef = Chef.create!({
      name: 'Matty Meatballs'
      })

    dish_1 = Dish.create!({
      name: 'Meatballs',
      description: 'Hearty, comes with four.',
      chef_id: "#{@chef.id}"
      })

    dish_2 = Dish.create!({
      name: 'Meatball sub',
      description: 'Big, delicious, filling.',
      chef_id: "#{@chef.id}"
      })

    dish_3 = Dish.create!({
      name: 'Meatball Mac n Cheese',
      description: 'Gooey and warm.',
      chef_id: "#{@chef.id}"
      })

    dish_4 = Dish.create!({
      name: "Plain Mac",
      description: 'For the simpletons',
      chef_id: "#{@chef.id}"
      })

    ingredient_1 = Ingredient.create!({
      name: 'Meatballs',
      calories: 360
      })

    ingredient_2 = Ingredient.create!({
      name: 'Marinara sauce',
      calories: 30
      })

    ingredient_4 = Ingredient.create!({
      name: 'Bun',
      calories: 70
      })

    ingredient_5 = Ingredient.create!({
      name: 'Cheese',
      calories: 60
      })

    ingredient_6 = Ingredient.create!({
      name: 'Mac',
      calories: 60
      })

    d_i_meatball_1 = DishIngredient.create!({
      dish_id: dish_1.id,
      ingredient_id: ingredient_1.id
      })

    d_i_meatball_2 = DishIngredient.create!({
      dish_id: dish_2.id,
      ingredient_id: ingredient_1.id
      })

    d_i_meatball_2 = DishIngredient.create!({
      dish_id: dish_3.id,
      ingredient_id: ingredient_1.id
      })

    d_i_marinara = DishIngredient.create!({
      dish_id: dish_1.id,
      ingredient_id: ingredient_2.id
      })


    d_i_bun = DishIngredient.create!({
      dish_id: dish_2.id,
      ingredient_id: ingredient_4.id
      })

    d_i_cheese_1 = DishIngredient.create!({
      dish_id: dish_2.id,
      ingredient_id: ingredient_5.id
      })

    d_i_cheese_2 = DishIngredient.create!({
      dish_id: dish_3.id,
      ingredient_id: ingredient_5.id
      })

    d_i_mac = DishIngredient.create!({
      dish_id: dish_3.id,
      ingredient_id: ingredient_6.id
      })

    d_i_mac_2 = DishIngredient.create!({
      dish_id: dish_4.id,
      ingredient_id: ingredient_6.id
      })

require "pry"; binding.pry
  end
end