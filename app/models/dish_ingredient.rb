class DishIngredient < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient

  def self.find_record(ingredient, dish)
    binding.pry
  end
end
