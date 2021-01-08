class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def find_ingredients
    dishes.joins(:ingredients).pluck('ingredients.name')
  end

  # def popular_ingredients
  #   require 'pry'; binding.pry
  #   # count the ingredient names that aren't unique and if the count is > 1 return the name of ingredient?
  #   dishes.joins(:ingredients).select('COUNT(ingredients.name as name_count')
  # end
end
