class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :character
  attr_accessible :character_id, :question_id, :result
end
