require 'rails_helper'

RSpec.describe Player, type: :model do
  before do
    @player = create(:player)
  end

  describe ".validates_presence_of" do
    it "validates presence of a team id" do
      expect(@player.team_id).to eq(1)
    end

    it "won't pass without a team for player" do
      @player.team = nil
      expect(@player).to_not be_valid
    end

    it "validates al horford's last name" do
      expect(@player.lastname).to eq("Horford")
    end

    it "won't pass without last name" do
      @player.lastname = nil
      expect(@player).to_not be_valid
    end

    it "won't pass without first name" do
      @player.firstname = nil
      expect(@player).to_not be_valid
    end
  end
end
