class Option < ActiveRecord::Base
  belongs_to :question

  def add_response!
    self.count += 1
    self.save!
  end
end

