class ChangeMinutesToIntegerOnStat < ActiveRecord::Migration
  def change
    change_column :stats, :minutes, :integer
  end
end
