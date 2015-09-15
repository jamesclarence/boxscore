require 'rails_helper'

RSpec.describe Game, type: :model do
  before do
    @game = create(:game)
    @team = create(:team)
    @stat = create(:stat)
  end

  it "has a team id" do
    expect(@game.team_id).to be_present
  end

  it "has an opponent" do
    expect(@game.opponent).to be_present
  end

  it "has statistics" do
    expect(@stat.game_id).to eq(1)
  end

  it "makes win? true when team score is greater than opponent score" do
    expect(@game.win?).to eq(true)
  end

  it "makes loss? true when team score is less than opponent score" do
    expect(@game.loss?).to eq(false)
  end

  it "expects result to equal 'Win'" do
    expect(@game.result).to eq("Win")
  end

  it "validates presence of team id" do
    expect(@game.team_id).to eq(1)
  end 

  it "validates presence of location" do
    expect(@game.location).to eq("Philips Arena")
  end 
end
