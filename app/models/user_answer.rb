class UserAnswer < ActiveRecord::Base
  belongs_to :question
  attr_accessible :question_id, :response, :session_id
end
