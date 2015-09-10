class AddColumnsToStats < ActiveRecord::Migration
  def change
    add_column :stats, :ft, :integer, default: 0
    add_column :stats, :fta, :integer, default: 0
  end
end
