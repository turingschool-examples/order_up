class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def distinct_ingredients
    self.dishes.joins(:ingredients).pluck('ingredients.name').uniq.sort
  end

  def popular_ingredients
    Ingredient.joins(:dishes).where('dishes.chef_id = ?', self).select('ingredients.*, count(*)').group(:id).order(count: :desc).limit(3)
  end

end
