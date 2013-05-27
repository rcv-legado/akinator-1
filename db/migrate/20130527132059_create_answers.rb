class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :result
      t.integer :question_id
      t.integer :character_id

      t.timestamps
    end
  end
end
