require 'rails_helper'

RSpec.describe "outings show page" do 
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
    ContestantOuting.create!(contestant: @bob, outing: @park)

    ContestantOuting.create!(contestant: @darel, outing: @helicopter)
    ContestantOuting.create!(contestant: @darel, outing: @baseball)
    # This sets up to start at this page before each test
  end

  describe "outing show page" do 
    it "displays the info about outing, count of contestants, contestatn names" do 
      visit outing_path(@park)

      expect(page).to have_content("Cheeseman")
      expect(page).to have_content("Picnic")
      expect(page).to have_content("09/12/19")
      expect(page).to have_content("Contestants: 2")

      within("#contestant_#{@darel.id}") do 
        expect(page).to have_content("Darel")
        expect(page).to have_button("Remove")
      end

      within("#contestant_#{@bob.id}") do 
        expect(page).to have_content("Bob")
        expect(page).to have_button("Remove")
      end
    end

    it " can delete a contestant form one outing without delteing it form the other" do 
      visit outing_path(@park)

      within("#contestant_#{@darel.id}") do 
        expect(page).to have_content("Darel")
        click_button("Remove")
      end

      expect(page).to_not have_content("Darel")
      
      visit outing_path(@helicopter)

      expect(page).to have_content("Darel")
    end

  end
end