class Ingredient < ApplicationRecord
  validates_presence_of :name, :calories
  has_many :ingredients_lists
  has_many :dishes, through: :ingredients_lists
end
