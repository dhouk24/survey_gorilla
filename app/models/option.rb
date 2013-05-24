class Option < ActiveRecord::Base
  belongs_to :question
  belongs_to :survey, :through => :question
  has_many   :responses 
  has_many   :users, :through => :responses

  def add_response!
    self.count += 1
    self.save!
  end
end

