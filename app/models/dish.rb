class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :recipies
  has_many :ingredients, through: :recipies

  def total_calories
    ingredients.sum {|ingredient| ingredient.calories}
  end
end
