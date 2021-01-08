require 'rails_helper'

RSpec.describe 'chef show page' do
  describe 'when i visit a show page' do
    it 'can display that chef name & description' do
      @chef = Chef.create!(name: "Bob")
      @chef2 = Chef.create!(name: "Billy")

      visit chefs_path
      expect(page).to have_link("Bob")
      expect(page).to have_link("Billy")
    end
  end
end
