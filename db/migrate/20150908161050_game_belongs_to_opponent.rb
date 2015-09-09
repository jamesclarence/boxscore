class GameBelongsToOpponent < ActiveRecord::Migration
  def change
    remove_column :games, :opponent
    add_column :games, :opponent_id, :integer
  end
end
