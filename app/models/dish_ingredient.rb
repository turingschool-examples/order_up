class DishIngredient < ApplicationRecord
  validates_presence_of :count
  belongs_to :dish
  belongs_to :ingredient

end
