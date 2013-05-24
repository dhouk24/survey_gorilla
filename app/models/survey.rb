class Survey < ActiveRecord::Base
  # has_one    :creator, :source => :user
  has_many   :questions
  has_many   :user_surveys
  has_many   :users, :through => :user_surveys

  validates   :creator, :presence => true
  validates   :name, :presence => true
end
