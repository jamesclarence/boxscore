class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :firstname
      t.string :lastname
      t.integer :position
      t.integer :number
      t.integer :height
      t.integer :weight
      t.references :team, index: true

      t.timestamps null: false
    end
    add_foreign_key :players, :teams
  end
end
