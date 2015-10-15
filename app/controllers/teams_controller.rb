class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @game = @team.games
  end

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(team_params)
    authorize @team
    @team.user = current_user

    if @team.save
      flash[:success] = "Team is saved"
      redirect_to @team
    else
      flash[:notice] = "Error saving your team. Please try again."
      render :new
    end
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to teams_path
  end

  private

  def team_params
    params.require(:team).permit(:school, :nickname, :city, :state, :zip, :league)
  end
end
