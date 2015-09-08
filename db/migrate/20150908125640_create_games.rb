class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :time
      t.datetime :date
      t.string :location
      t.string :opponent
      t.integer :team_score
      t.integer :opponent_score
      t.boolean :win
      t.boolean :loss

      t.timestamps null: false
    end
  end
end
