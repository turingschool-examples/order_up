class Ingredient < ApplicationRecord
  validates_presence_of :name, :calories
  has_many :ingredients_lists
  has_many :dishes
  has_many :dishes, through: :ingredients_lists
  has_many :chefs, through: :dishes

  def find_chef_ingredients #unfinished. I cannot for the life of me figure out how to tie an individual chef to their ingredients
    #without the use of a join table which isn't explicitly stated to do. Might try giving ingredients a ref to chefs through dishes
    Chef.joins(dishes: :ingredients).select('ingredients.* as unique_ingredients').group('ingredients.id')
  end
end
