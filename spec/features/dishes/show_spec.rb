#Story 1 of 3
describe 'As a visitor' do
  before(:each) do
    @chef = Chef.create!(name: "boyardee")
    @dish = Dish.create!(name: 'cornbread',
                        description: 'bread',
                        chef_id: @chef.id)
    visit "/dishes/#{@dish.id}"
  end
  describe "When I visit a dish's show page" do
    it "I see the dish’s name and description" do

    end
    it "And I see a list of ingredients for that dish" do

    end
    it "And I see the chef's name" do

    end
  end
end
