class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def top_3_ingredients
    Ingredient.joins(:dishes)
              .where("chef_id = #{self.id}")
              .select('ingredients.*, count(ingredients) as times_used')
              .order('times_used DESC')
              .group(:id)
              .limit(3)
  end

end
