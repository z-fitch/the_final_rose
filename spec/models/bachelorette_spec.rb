require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end
end
