class ChangePositionToStringInPlayersModel < ActiveRecord::Migration
  def change
    change_column :players, :position, :string
  end
end
