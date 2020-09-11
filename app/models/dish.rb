class Dish <ApplicationRecord
  validates_presence_of :name, :description, :calories
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients
end
