class Recipe < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient
  validates_presence_of :ingredient_quantity, numericality: { only_integer: true}
end
