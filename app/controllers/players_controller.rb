class PlayersController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @players = @team.players
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def edit
    @player = Player.find(params[:id])
  end

  def create
    @team = Team.find(params[:team_id])
    @player = Player.new(player_params)
    @player.team = @team

    if @player.save
      flash[:success] = "#{@player.firstname} #{@player.lastname} saved to your team."
      redirect_to new_team_player_path
    else
      flash[:notice] = "Error saving the player. Please try again."
      render :new
    end
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      redirect_to @player
    else
      render 'edit' 
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    redirect_to players_path
  end

  private

  def player_params
    params.require(:player).permit(:team_id, :firstname, :lastname, :position, :number, :height, :weight)
  end
end
