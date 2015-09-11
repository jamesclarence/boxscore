require 'rails_helper'

RSpec.describe Stat, type: :model do
  before do
    @stat = create(:stat)
  end

  describe "#game_played?" do
    it "validates presence of a player" do
      expect(@stat.player_id).to eq(1)
    end

    it "makes game_played? true when minutes are greater than 0" do
      @stat.minutes = 5
      expect(@stat.game_played?).to eq(true)
    end
  end

  describe "#fg_pct" do
    it "calculates field goal percentage correctly" do
      @stat.fg = 2
      @stat.fga = 5
      expect(@stat.fg_pct).to eq(0.4)
    end

    it "returns 0 if the game hasn't been played" do
      @stat.fg = 0
      @stat.fga = 0
      expect(@stat.fg_pct).to eq(0.0)
    end
  end

  describe "#two_pt" do
    it "calculates two point shots made correctly" do
      @stat.fg = 9
      expect(@stat.two_pt).to eq(6)
    end
  end

  describe "#two_pt_a" do
    it "calculates two point shot attempts correctly" do
      expect(@stat.two_pt_a).to eq(14)
    end
  end

  describe "#two_pt_pct" do
    it "returns zero if 2P shots made are 0" do
      @stat.fg = 1
      @stat.three_p = 1
      expect(@stat.two_pt_pct).to eq(0.0)
    end

    it "returns zero if 2P attempts are 0" do
      @stat.fga = 1
      @stat.three_p_a = 1
      expect(@stat.two_pt_pct).to eq(0.0)
    end

    it "calculates two point field goal percentage correctly" do
      expect(@stat.two_pt_pct).to eq(0.5)
    end
  end

  describe "#three_pt_pct" do
    it "returns zero if 3P shots made is 0" do
      @stat.three_p = 0
      expect(@stat.three_pt_pct).to eq(0.0)
    end

    it "returns zero if 3P attempts are 0" do
      @stat.three_p_a = 0
      expect(@stat.three_pt_pct).to eq(0.0)
    end          

    it "calculates three point field goal percentage correctly" do
      expect(@stat.three_pt_pct).to eq(0.5)
    end
  end

  describe "#ft_pct" do
    it "returns free throw percentage of zero if free throw shots made is 0" do
      @stat.ft = 0
      expect(@stat.ft).to eq(0.0)
    end

    it "returns free throw percentage of zero if free throw attempts are 0" do
      @stat.fta = 0
      expect(@stat.fta).to eq(0.0)
    end      

    it "calculates free throw percentage correctly" do
      expect(@stat.ft_pct).to eq(0.8)
    end
  end

  describe "#tsa" do  
    it "calculates true shooting attempts correctly" do
      expect(@stat.tsa).to eq(24.4)
    end
  end

  describe "#ts_pct" do
    it "returns true shooting percentage of zero if true shooting attempts are 0" do
      @stat.fga = 0
      @stat.fta = 0
      expect(@stat.ts_pct).to eq(0.0)
    end      

    it "returns true shooting percentage of zero if points are 0" do
      @stat.points = 0
      expect(@stat.ts_pct).to eq(0.0)
    end 

    it "calculates true shooting percentage correctly" do
      expect(@stat.ts_pct).to eq(0.635)
    end
  end

  describe "#efg" do
    it "returns effective field goal percentage of zero if field goal's made is 0" do
      @stat.fg = 0
      expect(@stat.efg).to eq(0.0)
    end  

    it "returns effective field goal percentage of zero if field goal attempts are 0" do
      @stat.fga = 0
      expect(@stat.efg).to eq(0.0)
    end      

    it "calculates effective field goal percentage correctly" do
      expect(@stat.efg).to eq(0.575)
    end
  end

  describe "#trb" do
    it "calculates total rebounds correctly" do
      expect(@stat.trb).to eq(8)
    end
  end

  # describe "#verify_points" do
  #   # it "verifies that a player's points are accurate based on made shots" do
  #   #   expect(@stat.verify_points?).to eq(true)
  #   # end
  #   it "validates that a player's points are accurate based on made 2P, 3P, and free throws" do
  #     expect(@stat.verify_points).to eq(true)
  #   end
  # end

  # describe "#verify_fga?" do
  #   it "verifies that af player's field goal attempts are accurate based on 2PA and 3PA" do
  #     expect(@stat.verify_fga).to eq(true)
  #   end
  # end 
end
