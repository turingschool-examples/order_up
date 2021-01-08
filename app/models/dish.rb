class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :ingredient_dishes
  has_many :ingredients, through: :ingredient_dishes

  def calorie_count
    Ingredient.joins(:ingredient_dishes)
    .select("ingredients.name, ingredient_dishes.amount, ingredients.calories")
    .sum("ingredient_dishes.amount * ingredients.calories")
  end
end
