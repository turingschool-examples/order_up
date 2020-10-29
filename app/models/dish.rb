class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :meals
  has_many :ingredients, through: :meals
end
