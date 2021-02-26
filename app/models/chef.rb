class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def chef_ingredients
    di = DishIngredient.where(dish_id: self.dishes.pluck(:id)).pluck(:ingredient_id)
    Ingredient.find(di)
  end
end
