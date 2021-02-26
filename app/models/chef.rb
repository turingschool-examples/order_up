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
end
