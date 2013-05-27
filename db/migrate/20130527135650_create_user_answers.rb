class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.string :session_id
      t.integer :question_id
      t.integer :response

      t.timestamps
    end
  end
end
