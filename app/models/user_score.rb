class UserScore < ActiveRecord::Base
  belongs_to :character
  attr_accessible :character_id, :score, :session_id
end
