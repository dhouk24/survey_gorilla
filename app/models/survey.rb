class Survey < ActiveRecord::Base
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
  has_many   :questions
  has_many   :user_surveys
  has_many   :users, :through => :user_surveys

  validates   :creator, :presence => true
  validates   :name, :presence => true
end
