class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def self.total_calories
    sum(:calories)
  end

  def self.top_ingredients
    unscope(:select).joins(:dish_ingredients).select("ingredients.*, count(*)").group(:id).order(count: :desc).limit(3)
  end
end
