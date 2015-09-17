class StatsController < ApplicationController
  def index
    @game = Game.find(params[:game_id])
    @player = Player.find(params[:player_id])
  end

  def show
  end

  def new
    @stat = Stat.new
    @game = Game.find(params[:game_id])
    @team = Team.find(params[:team_id])
  end

  def edit
    @game = Game.find(params[:game_id])
  end

  def create
    @game = Game.find(params[:game_id])
    @player = @game.players
    @stat = Stat.new

    if @game.save
      flash[:success] = "Stats saved for this game."
      redirect_to team_game_path(@team, @game)
    else
      flash[:notice] = "Error saving your statistics. Please try again."
      render :new
    end
  end

  def update
    @game = Game.find(params[:game_id])
    @stat = Stat.new
    @stat.game = @game
    @team = Team.find(params[:team_id])
    # @player = Player.find(params[:player_id])
    @team.players = @player

    if @stat.save
      flash[:success] = "Stats saved for this game."
      redirect_to team_game_path(@game)
    else
      flash[:notice] = "Error saving your statistics. Please try again."
      render :new
    end
  end

  def destroy
  end
end
