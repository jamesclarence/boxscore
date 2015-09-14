class StatsController < ApplicationController
  def index
    @game = Game.find(params[:game_id])
    # @stats = @game.stats # .find(params[:stat_id])
    @player = Player.find(params[:player_id])
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
