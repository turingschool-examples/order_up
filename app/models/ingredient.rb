class Ingredient < ApplicationRecord
  validates_presence_of :name, :calories

  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def self.calorie_total
    sum(:calories)
  end
end
