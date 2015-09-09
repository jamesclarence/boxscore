class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :fg
      t.integer :fga
      t.integer :three_p
      t.integer :three_p_a
      t.integer :orb
      t.integer :drb
      t.integer :assists
      t.integer :steals
      t.integer :blocks
      t.integer :turnovers
      t.integer :fouls
      t.time :minutes
      t.references :player, index: true

      t.timestamps null: false
    end
    add_foreign_key :stats, :players
  end
end
