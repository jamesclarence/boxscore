class AddTeamToStats < ActiveRecord::Migration
  def change
    add_reference :stats, :team, index: true
    add_foreign_key :stats, :teams
  end
end
