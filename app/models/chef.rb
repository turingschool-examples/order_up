class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_ingredients
    # DishIngredient.where(:).distinct
    self.dishes.map do |dish|
      dish.ingredients
    end.uniq
  end

end
