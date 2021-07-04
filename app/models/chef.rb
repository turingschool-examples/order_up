class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def top_3_ingredients
    require "pry"; binding.pry
    #Ingredient.joins(:dishes).group(:name).count
  end
end
