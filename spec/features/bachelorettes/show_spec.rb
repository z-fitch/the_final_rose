require 'rails_helper'

RSpec.describe "bach show page" do 
  before do
    @susie = Bachelorette.create!(name: "Susie Derkins", season_number: 28, season_description:"ITS CHAOS")
  end

  describe "it has bach info" do 
    it "has the name, season number, and the season description" do 
      visit bachelorette_path(@susie)

      expect(page).to have_content(@susie.name)
      expect(page).to have_content(@susie.season_description)
      expect(page).to have_content(@susie.season_number)

      expect(page).to have_link("Contestants")
    end
  end
end