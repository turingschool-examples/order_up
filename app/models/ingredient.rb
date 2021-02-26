class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def total_calories
    self.joins(:dish_ingredients)
    .distinct
    .sum("ingredients.calories * recipes.ingredient_quantity")
  end

end
