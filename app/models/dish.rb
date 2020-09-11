class Dish < ApplicationRecord

  belongs_to :chef
  has_many :ingredients_dish
  has_many :ingredients, through: :ingredients_dish
  validates_presence_of :name, :description

end
