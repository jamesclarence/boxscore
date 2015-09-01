require "rails_helper"

describe TeamsController, type: :controller do
  describe "GET index" do
    subject(:team) { create(:team) }
    it "assigns @teams" do
      # team = Team.create
      get :index
      expect(assigns(:teams)).to eq([team])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST create" do
    # subject(:team) { create(:team) }
    it "creates a team" do
      team = post :create, team: attributes_for(:team)
      expect(team.user_id).to eq(1) 
    end
  end

      # subject(:team) { create(:team) }
      # create(:team) do |team|
      #   team.create(attributes_for(:team))
      # end
end