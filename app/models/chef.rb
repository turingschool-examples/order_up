class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  # def favorite_ingredients
  #   require "pry"; binding.pry
  #   @ingredient_list = self.ingredients.order_by(:count)
  # end

end
