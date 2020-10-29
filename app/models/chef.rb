class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  has_many :ingredients, through: :dishes

  def top_three_ingredients
<<<<<<< HEAD
    self.ingredients.select('ingredients.name, COUNT(ingredients.name) as count').group("ingredients.name").order(count: :desc).limit(3)
=======
    self.ingredients.joins(:dish_ingredients).select('ingredients.*, COUNT(ingredients.id) as count')
>>>>>>> 71536483dea284c8cd462406e05a4650e53cbd66
  end
end
