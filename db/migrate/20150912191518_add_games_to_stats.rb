class AddGamesToStats < ActiveRecord::Migration
  def change
    add_reference :stats, :game, index: true
    add_foreign_key :stats, :games
  end
end
