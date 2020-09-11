class Ingredient <ApplicationRecord
  validates_presence_of :name, :calories
  has_many :dishes, through: :dish_ingredients
  has_many :chefs, through: :dishes
  has_many :dish_ingredients
end
