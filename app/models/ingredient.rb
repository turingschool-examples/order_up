class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  validates_presence_of :name, :calories
  validates :calories, numericality: { greater_than_or_equal_to: 0 } 
end
