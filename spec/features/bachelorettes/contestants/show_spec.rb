require 'rails_helper'

RSpec.describe "contestants show page" do 
  before do 
    @susie = Bachelorette.create!(name: "Susie Derkins", season_number: 28, season_description:"ITS CHAOS")
    @karen = Bachelorette.create!(name: "Karen", season_number: 29, season_description:"call manager...pls")

    @darel = @susie.contestants.create!(name: "Darel", age: 24, hometown: "Denver")
    @bob = @susie.contestants.create!(name: "Bob", age: 27, hometown: "Denver")

    @beavis = @karen.contestants.create!(name: "Beavis", age: 28, hometown: "Highland")
    @butthead = @karen.contestants.create!(name: "Mr. Butthead", age: 25, hometown: "Highland")
    
    @park = Outing.create!(name: "Picnic", location: "Cheeseman", date: "09/12/19")
    @helicopter = Outing.create!(name: "Flying", location: "Air", date: "09/13/19")
    @baseball = Outing.create!(name: "Sports", location: "Ball park", date: "09/14/19")

    ContestantOuting.create!(contestant: @darel, outing: @park)
    ContestantOuting.create!(contestant: @darel, outing: @helicopter)
    ContestantOuting.create!(contestant: @darel, outing: @baseball)

    visit bachelorette_contestant_path(@susie, @darel)
    # This sets up to start at this page before each test
  end

  describe "visiting a contestant show page" do 
    it "has the attributes listed" do 
      expect(page).to have_content("Darel")
      expect(page).to have_content("Season 28")
      expect(page).to have_content("ITS CHAOS")
      expect(page).to have_link("Picnic", href: outing_path(@park))
      expect(page).to have_link("Flying", href: outing_path(@helicopter))
      expect(page).to have_link("Sports", href: outing_path(@baseball))


      visit bachelorette_contestant_path(@susie, @bob)

      expect(page).to have_content("Bob")
    end
  end

end