class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients_list
    dishes.ingredients_list
  end

  def top_ingredients
    Ingredient
    .joins(:dishes)
    .where('chef_id = ?', self.id)
    .select("ingredients.*, count('ingredients.id') as ingredient_count")
    .group('ingredients.id')
    .order(ingredient_count: :desc)
    .limit(3)
  end
end
