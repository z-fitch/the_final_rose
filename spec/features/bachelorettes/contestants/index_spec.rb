require 'rails_helper'

RSpec.describe "bach contestants index page" do 
  before do 
    @susie = Bachelorette.create!(name: "Susie Derkins", season_number: 28, season_description:"ITS CHAOS")
    @karen = Bachelorette.create!(name: "Karen", season_number: 29, season_description:"call manager...pls")

    @darel = @susie.contestants.create!(name: "Darel", age: 24, hometown: "Denver")
    @bob = @susie.contestants.create!(name: "Bob", age: 27, hometown: "Denver")

    @beavis = @karen.contestants.create!(name: "Beavis", age: 28, hometown: "Highland")
    @butthead = @karen.contestants.create!(name: "Mr. Butthead", age: 25, hometown: "Highland")
  end

  describe "bach contestants"  do 
    it "has contestatns" do 
      visit bachelorette_path(@susie)

      click_link("Contestants")

      expect(current_path).to eq(bachelorette_contestants_path(@susie))

      expect(page).to have_link("Darel", href: bachelorette_contestant_path(@susie, @darel))
      expect(page).to have_link("Bob", href: bachelorette_contestant_path(@susie, @bob))

      expect(page).to_not have_content("Beavis")
      expect(page).to_not have_content("Mr. Butthead")
    end

    it "has contestant info" do 
      visit bachelorette_contestants_path(@susie)

      expect(page).to have_content("24")
      expect(page).to have_content("27")
      expect(page).to have_content("Denver", count: 2)
      expect(page).to have_content("Denver").twice

      expect(page).to_not have_content("Highland").twice
    end
  end
end