class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  
  def ingredients
    Ingredient.joins(:dishes).where('dishes.chef_id = ?', self.id)
  end

  def most_popular_ingredients
    ingredients.select('ingredients.*, count(dishes) as dish_count').group('ingredients.id').order(dish_count: :desc).limit(3)
  end
end
