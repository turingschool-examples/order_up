class DishIngredient < ApplicationRecord
  # Relationships
  belongs_to :ingredient
  belongs_to :dish
end
