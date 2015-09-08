class AddTeamsToGames < ActiveRecord::Migration
  def change
    add_reference :games, :team, index: true
    add_foreign_key :games, :teams
  end
end
