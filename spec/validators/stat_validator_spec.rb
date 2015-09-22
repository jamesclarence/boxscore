# require 'active_model'
# # require 'rspec/rails/extensions'
# require File.expand_path('app/validators/stat_validator_spec.rb')

require 'rails_helper'

RSpec.describe StatsValidator, type: :model do
  before do
    @stat = create(:stat)
  end

  describe ".validate(record)" do
    it "should be valid if points = 2P + 3P + FT made" do
      @stat.valid?
      # expect(@stat.points).to be_valid
    end

    it "gives error message if points are invalid" do
      @stat.points = 32
      expect(@stat.errors.full_messages).to eq("Points must equal 2P, 3P, and FT made")
    end

  end
end