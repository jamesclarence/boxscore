class TeamsController < ApplicationController

  def index
    @team = Team.find(team_params)
  end

  def show
    @team = Team.find(team_params)
  end

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find(team_params)
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      flash[:notice] = "Team is saved"
    else
      flash[:notice] = "Error saving your team. Please try again."
      render :new
    end
  end

  def update
    
  end

  def destroy
    
  end

  private

  def team_params
    params.require(:event).permit(:id)
  end
end
