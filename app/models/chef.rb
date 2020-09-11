class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def favorite_ingredients
    @ingredient_list = self.ingredients
  end

end
