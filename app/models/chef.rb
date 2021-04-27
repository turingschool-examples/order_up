class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def all_ingredients_used
    ingredients.distinct('ingredients.id').order('ingredients.name').pluck('ingredients.name')
  end

  def top_ingredients
    #Chef.joins(:ingredients).joins(:dishes).select("ingredients.name, count(dishes) as ingredient_dish_count").group_by('ingredient.id')
    #I would go about this in a different manner, starting from ingredient. I just ran out of time. 
  end
end
