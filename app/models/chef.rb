class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_chef_ingredients
    Dish.joins(:ingredients).select("ingredients.name").where("chef_id = #{self.id}").distinct.order("ingredients.name").pluck("ingredients.name")
  end
end
