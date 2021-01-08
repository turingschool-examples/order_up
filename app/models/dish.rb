class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :ingredients_lists
  has_many :ingredients, through: :ingredients_lists
end
