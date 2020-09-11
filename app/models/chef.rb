class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def dish_ingredients
    dishes.flat_map do |dish|
      DishIngredient.where(dish_id: dish.id)
    end
  end

  
end
