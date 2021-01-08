class Ingredient < ApplicationRecord
  validates_presence_of :name, :calories

  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def self.calorie_total
    sum(:calories)
  end

  def self.unique_ingredients
    select(:name).distinct.pluck(:name)
  end
end
