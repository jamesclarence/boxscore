require "rails_helper"

describe Team do
  subject(:team) { create(:team) }
    
  it "validates presence of a user id" do
    expect(team.user).to be_valid
  end
end