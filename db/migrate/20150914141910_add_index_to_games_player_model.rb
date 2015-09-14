require_relative '20150913170328_create_game_player_table'

class AddIndexToGamesPlayerModel < ActiveRecord::Migration
  def change
    revert CreateGamePlayerTable

    create_table :games_players do |t|
      t.references :game, :player
    end

    add_index :games_players, [:game_id, :player_id]
  end
end
