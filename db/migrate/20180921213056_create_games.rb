class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :game_date
      t.integer :player_id
      t.integer :opponent_id
      t.integer :player_score, default: 0
      t.integer :opponent_score, default: 0
      t.integer :winner_id

      t.timestamps null: false
    end
  end
end
