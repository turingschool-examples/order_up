class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def chef_ingredients(chef)
    Dish.joins(:chef, :ingredients).select('ingredients.name AS ingredient_name').where("chefs.name = '#{chef.name}'")
  end
end
