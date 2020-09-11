class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients_used
    Ingredient.joins(:dish_ingredients).joins(:dishes).distinct.order(:name).pluck(:name)
  end
end
