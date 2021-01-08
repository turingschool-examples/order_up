class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def top_ingredients
    ingredients.select("ingredients.name, count(ingredients) as num").group("ingredients.name").order("num DESC").limit(3)
  end

  def unique_ingredients
    ingredients.pluck(:name).uniq
    #most efficient code to get unqiue names from records, uses some ruby
  end
end
