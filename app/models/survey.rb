class Survey < ActiveRecord::Base
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
  has_many   :questions
  has_many   :options, :through => :questions
  mount_uploader :image, PhotoUploader

  validates   :creator, :presence => true
  validates   :name, :presence => true
end
