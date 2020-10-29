class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_chef_ingredients
    Ingredient.joins(:dishes).joins(:dish_ingredients).select("dish_ingredients.*, ingredients.name, dishes.chef_if").where("chef_id = #{self.id}")
  end
end
