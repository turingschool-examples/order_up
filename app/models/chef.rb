class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients
    ingredients = []
    dishes.each do |dish|
      dish.ingredients.each do |ingredient|
        ingredients << ingredient
      end
    end
    ingredients.uniq
  end
end
