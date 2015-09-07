require "rails_helper"

describe PlayersController, type: :controller do
  let(:user) {create(:user)}
  before {sign_in(user)}

  before(:each) do
    @team = create(:team)
    @player = create(:player)
  end

  describe "GET index" do
    it "assigns all players as @players" do
      get :index, team_id: @team
      expect(assigns(:players)).to eq(@team.players)
    end

    it "renders the index template" do
      get :index, team_id: @team
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns the requested player to @player" do
      get :show, id: @player, team_id: @team
      expect(assigns(:player)).to eq(@player)
    end

    it "renders the :show template" do
      get :show, id: @player, team_id: @team
      expect(response).to render_template("show")
    end
  end

  describe "GET new" do
    it "assigns a new player as @player" do
      get :new, team_id: @team
      expect(assigns(:player)).to be_a_new(Player)
    end
  end

  describe "GET edit" do
    it "assigns a new player as @player" do
      get :edit, id: @player, team_id: @team
      expect(assigns(:player)).to eq(@player)
    end
  end

  describe "POST create" do
    context "valid attributes" do
      it "creates a new Player" do
        expect{
          post :create, team_id: @team, player: attributes_for(:player)
        }.to change(Player, :count).by(1)
      end

      it "redirects to the team's players#index" do
        post :create, team_id: @team, player: attributes_for(:player)
        expect(response).to redirect_to("/teams/1/players")
      end
    end

    context "invalid attributes" do
      it "does not save the new player" do
        post :create, team_id: @team, player: attributes_for(:player, weight: nil)
        expect(@player).to_not be_valid
      end

      it "re-renders players#new if invalid attributes" do
        post :create, team_id: @team, player: attributes_for(:player, position: nil)
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
  end

  describe "DELETE destroy" do
  end  
end