class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients
    require 'pry'; binding.pry
    dishes.joins(:ingredients).select("ingredients.name").distinct
  end

  #insufficient time to test method
  
  # def top_three_ingredients
  #   dishes.joins(:ingredients).select("count(ingredients.name) as dish_count, ingredients.name").group("ingredients.name").order(dish_count: :desc).limit(3)
  # end

end
