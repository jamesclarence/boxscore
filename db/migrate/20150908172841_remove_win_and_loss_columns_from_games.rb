class RemoveWinAndLossColumnsFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :win
    remove_column :games, :loss
    change_column_default :games, :team_score, 0
    change_column_default :games, :opponent_score, 0
  end
end
