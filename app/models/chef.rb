class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :dish_ingredients, through: :dishes
  has_many :ingredients, through: :dish_ingredients

  def top_three_ingredients
    []
    # dish_ingredients.joins(:ingredients).group(dish_id).count(ingredient.*)
  end
end
