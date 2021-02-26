class Ingredient < ApplicationRecord
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients

  def self.total_calories
    sum(:calories)
  end

  def self.find_from_chef(chef_id)
    joins(:dishes).where('dishes.chef_id = ?', chef_id)
  end

  def self.find_distinct(chef_id)
    find_from_chef(chef_id).distinct
  end

  def self.popular_ingredients_for(chef_id)
    find_from_chef(chef_id)
    .group(:id)
    .having('count(ingredients.id) > 1')
    .limit(3)
  end
end
