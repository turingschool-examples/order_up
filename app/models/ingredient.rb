class Ingredient < ApplicationRecord

  has_many :ingredients_dish
  has_many :dishes, through: :ingredients_dish
  validates_presence_of :name
  validates_presence_of :calories

end
