class AddPointsToStatModel < ActiveRecord::Migration
  def change
    add_column :stats, :points, :integer
  end
end
