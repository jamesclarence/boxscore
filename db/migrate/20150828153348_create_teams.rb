class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :school
      t.string :nickname
      t.string :city
      t.string :state
      t.string :zip
      t.string :league
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :teams, :users
  end
end
