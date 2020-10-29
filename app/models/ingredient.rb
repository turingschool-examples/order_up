class Ingredient < ApplicationRecord
  # Relationships
  has_many :dish_ingredients
end
