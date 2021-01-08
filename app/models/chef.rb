class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, -> {distinct}, through: :dishes

  def popular_ingredients
    pops = ingredients.joins(:components).select("ingredients.name, count(*) as count").group("ingredients.name").order("count DESC").limit(3)
    pops.map do |pop|
      pop.name
    end
  end
end
