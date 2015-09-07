require "rails_helper"

describe TeamsController, type: :controller do
  let(:user) { create(:user)}
  before {sign_in(user)}

  describe "GET index" do
    it "assigns @teams" do
      team = create(:team)
      get :index
      expect(assigns(:teams)).to eq([team])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    let(:team) {create(:team)}
    it "assigns the requested team to @team" do
      get :show, id: team
      expect(assigns(:team)).to eq(team)
    end

    it "renders the :show template" do
      get :show, id: team
      expect(response).to render_template("show")
    end
  end

  describe "GET new" do
    it "assigns a new team as @team" do
      get :new
      expect(assigns(:team)).to be_a_new(Team)
    end
  end

  describe "GET edit" do
    let(:team) {create(:team)}
    it "assigns the requested team to @team" do
      get :edit, id: team
      expect(assigns(:team)).to eq(team)
    end
  end

  describe "POST create" do
    it "creates a team" do
      expect{
        post :create, team: attributes_for(:team)
        }.to change(Team, :count).by(1) 
    end

    it "redirects to new team" do
        post :create, team: attributes_for(:team)
        expect(response.status).to eq(302)
    end

    it "assigns team" do
        post :create, team: attributes_for(:team)
        expect(assigns(:team)).to be_present
    end
  end

  describe "PUT update" do
    before :each do
      @team = create(:team)
    end

    context "valid attributes" do
      it "located the requested @team" do
        put :update, id: @team, team: attributes_for(:team)
        expect(assigns(:team)).to eq(@team)
      end

      it "changes @team's attributes" do
        put :update, id: @team, team: attributes_for(:team, school: "Philadelphia")
        @team.reload
        expect(@team.school).to eq("Philadelphia")
      end

      it "redirects to the updated team" do
        put :update, id: @team, team: attributes_for(:team)
        expect(response).to redirect_to(@team)
      end
    end

    context "invalid attributes" do
      it "locates the requested @team" do
        put :update, id: @team, team: attributes_for(:team)
        expect(assigns(:team)).to_not eq(2)
      end

      it "does not change @team's attributes" do
        put :update, id: @team, team: attributes_for(:team, school: nil)
        @team.reload
        expect(@team.school).to_not eq("Philadelphia")
      end

      it "re-renders the edit method" do
        put :update, id: @team, team: attributes_for(:team, school: nil)
        expect(response).to redirect_to(@team)
      end
    end
  end

  describe "DELETE destroy" do
    before :each do
      @team = create(:team)
    end

    it "deletes the team" do
      expect{
        delete :destroy, id: @team
      }.to change(Team, :count).by(-1)
    end

    it "redirects to team#index" do
      delete :destroy, id: @team
      expect(response).to redirect_to(teams_path)
    end
  end
end