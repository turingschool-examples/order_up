class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_ingredients
    ingredients = []
    self.dishes.each do |dish|
      dish.ingredients.each do |ingredient|
        ingredients << ingredient.name
      end
    end
    ingredients.uniq!
  end
end
