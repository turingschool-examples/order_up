class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def distinct_ingredients
    self.dishes.joins(:ingredients).pluck('ingredients.name').uniq.sort
  end

  def popular_ingredients
    require "pry"; binding.pry
    Ingredient.joins(:dishes).where('dishes.chef_id = self').select('ingredients.name, count(*)').group(:id)
  end

end
