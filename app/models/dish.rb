class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  def ingredients
    # require "pry"; binding.pry
    dish_ingredients.map(&:id)
    # dish_ingredients(:id)
  end

  def ingredient_names
    ingredients 

  end
end
