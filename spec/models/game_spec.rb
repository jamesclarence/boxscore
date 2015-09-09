require 'rails_helper'

RSpec.describe Game, type: :model do
  before do
    @game = create(:game)
  end

  it "makes win? true when team score is greater than opponent score" do
    expect(@game.win?).to eq(true)
  end

  it "makes loss? true when team score is less than opponent score" do
    expect(@game.loss?).to eq(false)
  end

  it "expects result to equal 'win'" do
    expect(@game.result).to eq("win")
  end

  it "validates presence of team id" do
    expect(@game.team_id).to eq(1)
  end 

  it "validates presence of location" do
    expect(@game.location).to eq("Philips Arena")
  end 
end
