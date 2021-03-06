class GamesController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @games = @team.games
  end

  def show
    @game = Game.find(params[:id])
    @team = Team.find(params[:team_id])
  end

  def new
    @team = Team.find(params[:team_id])
    @game = Game.new
  end

  def edit
    @game = Game.find(params[:id])
    @team = Team.find(params[:team_id])
  end

  def create
    @team = Team.find(params[:team_id])
    @game = Game.new(game_params)
    @game.team = @team

    if @game.save
      flash[:success] = "Game saved to your team."
      redirect_to new_team_game_stat_path(@team, @game)
    else
      flash[:notice] = "Error saving the game. Please try again."
      render :new
    end
  end

  def update
    @game = Game.find(params[:id])

    if @game.update(game_params)
      redirect_to team_path
    else
      render 'edit'
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    redirect_to team_games_path
  end

  private

  def game_params
    params.require(:game).permit(:date, :location, :opponent_id, :team_score, :opponent_score,
      :stats_attributes => [:id, :player_id, :game_id, :fg, :fga, :three_p, :three_p_a, :orb, :drb, :assists, :steals, :blocks, :turnovers, :fouls, :minutes, :points, :ft, :fta]
      )
  end
end
