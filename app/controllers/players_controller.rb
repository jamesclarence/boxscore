class PlayersController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @players = @team.players
  end

  def show
    @player = Player.find(params[:id])
    @stat = @player.stats
    @team = Team.find(params[:team_id])
    # @game = Game.find(params[:game_id])
  end

  def new
    @player = Player.new
  end

  def edit
    @player = Player.find(params[:id])
    @team = Team.find(params[:team_id])
  end

  def create
    @team = Team.find(params[:team_id])
    @player = Player.new(player_params)
    @player.team = @team

    if @player.save
      flash[:success] = "#{@player.firstname} #{@player.lastname} saved to your team."
      redirect_to team_players_path
    else
      flash[:notice] = "Error saving the player. Please try again."
      render :new
    end
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      redirect_to team_player_path
    else
      render 'edit' 
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    redirect_to team_players_path
  end

  private

  def player_params
    params.require(:player).permit(:team_id, :firstname, :lastname, :position, :number, :height, :weight)
  end
end
