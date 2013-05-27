class Character < ActiveRecord::Base
  has_many :answers
  has_many :questions, :through => :answers
  attr_accessible :name
end
