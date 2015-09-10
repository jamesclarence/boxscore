require 'rails_helper'

RSpec.describe Stat, type: :model do
  before do
    @stat = create(:stat)
  end

  it "validates presence of a player" do
    expect(@stat.player_id).to eq(1)
  end

  it "makes game_played? true when minutes are greater than 0" do
    expect(@stat.game_played?).to eq(true)
  end

  it "calculates field goal percentage correctly" do
    expect(@stat.fg_pct).to eq(0.5)
  end

  it "calculates two point shots made correctly" do
    expect(@stat.two_pt).to eq(7)
  end

  it "calculates two point shot attempts correctly" do
    expect(@stat.two_pt_a).to eq(14)
  end

  it "calculates two point field goal percentage correctly" do
    expect(@stat.two_pt_pct).to eq(0.5)
  end

  it "calculates three point field goal percentage correctly" do
    expect(@stat.three_pt_pct).to eq(0.5)
  end

  it "calculates free throw percentage correctly" do
    expect(@stat.ft_pct).to eq(0.8)
  end

  it "calculates true shooting attempts correctly" do
    expect(@stat.tsa).to eq(24.4)
  end

  it "calculates true shooting percentage correctly" do
    expect(@stat.ts_pct).to eq(0.635)
  end

  it "calculates effective field goal percentage correctly" do
    expect(@stat.efg).to eq(0.575)
  end

  it "calculates total rebounds correctly" do
    expect(@stat.trb).to eq(8)
  end

  it "verifies that a player's points are accurate based on made shots" do
    expect(@stat.verify_points?).to eq(true)
  end

  it "verifies that a player's field goal attempts are accurate based on 2PA and 3PA" do
    expect(@stat.verify_fga?).to eq(true)
  end               
end
