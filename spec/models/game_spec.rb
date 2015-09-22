require 'rails_helper'

RSpec.describe Game, type: :model do
  before do
    @game = create(:game)
    @team = create(:team)
  end

  it "has a team id" do
    expect(@game.team_id).to be_present
  end

  it "has an opponent" do
    expect(@game.opponent).to be_present
  end

  it "has statistics" do
    expect(@game.stats).to be_present
  end

  describe "Game scopes" do
    it "team wins when team score is greater than opponent score" do
      expect(@game.result).to eq("Win")
    end

    it "expects result to equal 'Loss'" do
      @game.team_score = 80
      @game.opponent_score = 95
      expect(@game.result).to eq("Loss")
    end
  end
  
  it "validates presence of team id" do
    expect(@game.team_id).to eq(1)
  end 

  it "validates presence of location" do
    expect(@game.location).to eq("Philips Arena")
  end 
end
