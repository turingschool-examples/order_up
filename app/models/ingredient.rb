class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def self.total_calories
    sum(:calories)
  end

  def self.find_from_chef(chef_id)
    joins(:dishes).where('dishes.chef_id = ?', chef_id)
  end
end
