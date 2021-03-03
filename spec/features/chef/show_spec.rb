require 'rails_helper' 

RSpec.describe "Chef Show page" do 
  before(:each) do 
    @chef = Chef.create!(name: "Bourdain")
  end
  describe "When I visit a chefs show page" do 
    it "I see the name of the chef and a link to see the ingredients the chef uses" do 
      visit "chef/#{@chef.id}"

      within "#chef-name" do 
        expect(page).to have_content("Chef's name: #{@chef.name}")
      end

      within "#all-ingredients" do 
        expect(page).to have_content("All Ingredients")
        click_on("All Ingredients")
        expect(current_path).to eq("/chef/#{@chef.id}/ingredient")
      end
    end
  end

end
