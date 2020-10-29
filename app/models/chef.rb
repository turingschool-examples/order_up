class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes


#Too much ruby, find an AR solution
  def find_ingredients
    dishes.flat_map do |dish|
      dish.ingredients.flat_map do |ingredient|
        ingredient.name
      end
    end.uniq
  end
end
