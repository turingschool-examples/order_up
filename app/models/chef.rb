class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_ingredients
    Ingredient.joins(:dishes).where(dishes: {chef_id: self.id})
  end

  def most_popular
    #join dishes to ingredients, filter by chef_id, count(:dishes).group()
    Ingredient.joins(:dishes).where(dishes: {chef_id: self.id}).order(:count).limit(3)
      
  end
end
