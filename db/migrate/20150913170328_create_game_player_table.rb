class CreateGamePlayerTable < ActiveRecord::Migration
  def change
    create_table :games_players, id: false do |t|
      t.references :game, :player
    end

    add_index :games_players, [:game_id, :player_id]
  end
end
