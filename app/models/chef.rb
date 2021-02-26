class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def all_ingredients_used
    ingredients.distinct('ingredients.id').order('ingredients.name').pluck('ingredients.name')
  end

  def top_ingredients
    ingredients.distinct('ingredients.id').order('ingredients.name')
  end
end
Chef.joins(:ingredients).joins(:dishes).select("ingredients.name, count(dishes) as ingredient_dish_count").group_by('ingredient.id')
