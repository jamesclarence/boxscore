require "rails_helper"

describe User do
  before do
    @user = create(:user)
  end

  describe "defaults to the role of standard" do
    
    it "defaults to the role of standard" do
      expect(@user.role).to eq("standard")
    end
  
  end
end