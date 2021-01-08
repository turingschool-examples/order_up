require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  describe "instance methods" do
    it '#ingredients_list' do
      @chef = Chef.create!(name: "Tim")
      @dif_chef = Chef.create!(name: "Not this chef")
      @mac = @chef.dishes.create!(name: 'mac n cheese', description: 'cheesy good')
      @dif_dish = @dif_chef.dishes.create!(name: 'Different dish', description: 'good')
      @tikka_masala = @chef.dishes.create!(name: 'tikka masala', description: 'classic indian')
      @sugar = @dif_dish.ingredients.create!(name: 'sugar', calories: 100)
      @cream = @tikka_masala.ingredients.create!(name: 'cream', calories: 1000)
      @masala = @tikka_masala.ingredients.create!(name: 'masala', calories: 400)
      @pasta = @mac.ingredients.create!(name: 'pasta', calories: 1000)
      @cheese = @mac.ingredients.create!(name: 'cheese', calories: 100)
      @mac.ingredients << @cream

      expected = [@cream, @masala, @pasta, @cheese].sort
      expect(@chef.ingredients_list.sort).to eq(expected)
    end
  end
end
