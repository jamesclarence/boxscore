require "rails_helper"

describe Team do

  before do
    @team = create(:team)
  end 

  it "validates presence of a user id" do
    expect(@team.user_id).to eq(1)
  end

end