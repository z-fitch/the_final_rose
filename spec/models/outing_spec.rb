require "rails_helper"

RSpec.describe Outing, type: :model do
  describe "relationships" do
    it {should have_many :contestant_outings}
    it {should have_many :contestants}
  end

  describe "instance_methods" do 
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
      ContestantOuting.create!(contestant: @beavis, outing: @park)
      ContestantOuting.create!(contestant: @butthead, outing: @park)
      
      ContestantOuting.create!(contestant: @darel, outing: @helicopter)
      ContestantOuting.create!(contestant: @bob, outing: @helicopter)
      
      ContestantOuting.create!(contestant: @darel, outing: @baseball)
    end

    describe "count_contestants" do 
      it "counts the contestants" do 
        expect(@park.count_contestants).to eq(4)
        expect(@helicopter.count_contestants).to eq(2)
      end
    end
  end
end