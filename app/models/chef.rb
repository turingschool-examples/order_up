class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def chef_ingredients
    ingredient_array = dishes.map do |dish|
      dish.ingredients
    end
    ingredient_array
  end
end
