class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  def calorie_calculation
    ingredients.sum("calories")
  end

  def dish_information
    ingredients.select("name")
  end

  def chef_information
    chef.name
  end

  def remove_ingredient(ingredient_id)
    remove_association = DishIngredient.where("ingredient_id = ?", ingredient_id).first.id
    DishIngredient.destroy(remove_association)
  end

end
