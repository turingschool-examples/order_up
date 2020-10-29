class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_dish_ingredients
    self.dishes.map do |dish|
      dish.ingredient_list
    end.flatten
  end
end
