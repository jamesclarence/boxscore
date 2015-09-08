require 'rails_helper'

describe GamesController, type: :controller do
  let(:user) {create(:user)}
  before {sign_in(user)}

  before(:each) do
    @team = create(:team)
    @game = create(:game)
  end

  describe "GET index" do
    it "assigns all games as @games" do
      get :index, team_id: @team
      expect(assigns(:games)).to eq(@team.games)
    end

    it "renders the games#index template" do
      get :index, team_id: @team
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns the requested game to @game" do
      get :show, id: @game, team_id: @team
      expect(assigns(:game)).to eq(@game)
    end

    it "renders the :show template" do
      get :show, id: @game, team_id: @team
      expect(response).to render_template("show")
    end
  end

  describe "GET new" do
    it "assigns new game to @game" do
      get :show, id: @game, team_id: @team
      expect(assigns(:game)).to eq(@game)
    end
  end

  describe "GET edit" do
    it "assigns a new game as @game" do
      get :edit, id: @game, team_id: @team
      expect(assigns(:game)).to eq(@game)
    end
  end

  describe "POST create" do
    context "valid attributes" do
      it "creates a new game" do
        expect{
          post :create, team_id: @team, game: attributes_for(:game)
        }.to change(Game, :count).by(1)
      end

      it "redirects to the team's games#index" do
        post :create, team_id: @team, game: attributes_for(:game)
        expect(response).to redirect_to("/teams/1/games")
      end
    end

    context "invalid attributes" do
      it "does not save the new game" do
        expect{
          post :create, team_id: @team, game: attributes_for(:game, team_id: nil)
        }.to_not change(Game,:count)
      end

      it "re-renders games#new if invalid attributes" do
        post :create, team_id: @team, game: attributes_for(:game, team_score: nil)
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
  end

  describe "DELETE destroy" do
  end
end
