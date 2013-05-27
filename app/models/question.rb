class Question < ActiveRecord::Base
  has_many :answers
  has_many :characters, :through => :answers
  attr_accessible :question
  def to_s
    return self.question
  end
end
