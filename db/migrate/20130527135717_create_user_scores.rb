class CreateUserScores < ActiveRecord::Migration
  def change
    create_table :user_scores do |t|
      t.string :session_id
      t.integer :character_id
      t.integer :score

      t.timestamps
    end
  end
end
