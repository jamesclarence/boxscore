require 'rails_helper'

RSpec.describe Player, type: :model do
  before do
    @player = create(:player)
  end

  it "validates presence of a team id" do
    expect(@player.team_id).to eq(1)
  end

  it "validates al horford's last name" do
    expect(@player.lastname).to eq("Horford")
  end
end
