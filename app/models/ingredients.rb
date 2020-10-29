class Ingredient < ApplicationRecord
has_many :ingredients_dishes
has_many :dishes, through: :ingredients_dishes
end
