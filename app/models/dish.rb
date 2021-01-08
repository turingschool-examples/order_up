class Dish <ApplicationRecord
  validates_presence_of :name, :description

  belongs_to :chef, dependent: :destroy
  has_many :dish_ingredients, dependent: :destroy
  has_many :ingredients, through: :dish_ingredients
end
