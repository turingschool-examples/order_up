class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def chef_ingredient_dishes
    dishes.joins(:ingredients)
          .select('dishes.*, ingredients.name as ingredient_name')
          .distinct(:ingredient_name)
          .pluck(:ingredient_id)
  end

  def chef_ingredients
    Ingredient.find(chef_ingredient_dishes)
  end

  def most_popular_ingredients_id
    dishes.joins(:ingredients)
          .select('dishes.*, ingredients.id as ingredient_id')
          .order('count(ingredient_id) desc')
          .group(:ingredient_id)
          .limit(3)
          .pluck(:ingredient_id)
  end

  def most_popular_ingredients
    Ingredient.find(most_popular_ingredients_id)
  end
end
