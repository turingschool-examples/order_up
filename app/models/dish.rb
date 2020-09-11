class Dish <ApplicationRecord
  validates_presence_of :name, :description
  has_many :recipes
  has_many :ingredients, through: :recipes

  belongs_to :chef
end
